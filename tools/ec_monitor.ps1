# EC Monitor Script for LG Gram
# Uses RWEverything to continuously monitor EC register changes
# 
# Usage: .\ec_monitor.ps1 -RwPath "C:\Path\To\Rw.exe"
# 
# This script will:
# 1. Dump all EC registers (0x00-0xFF) every second
# 2. Compare with previous dump
# 3. Highlight any changes in real-time
#
# Perfect for reverse engineering EC registers while toggling features!

param(
    [string]$RwPath = "Rw.exe",  # Path to RWEverything's Rw.exe
    [int]$Interval = 1000,       # Polling interval in ms
    [string]$OutputDir = ".\ec_dumps",
    [switch]$SaveDumps          # Save each dump to a file
)

# EC I/O ports
$EC_DATA = 0x62
$EC_CMD = 0x66

# Create temp file for RW commands
$tempScript = [System.IO.Path]::GetTempFileName() + ".rw"

# Function to create RW script for reading all EC registers
function New-ECDumpScript {
    param([string]$OutputFile)
    
    $script = @"
; EC Dump Script for RWEverything
; Reads EC registers 0x00 to 0xFF

; Wait for EC ready (OBF=0, IBF=0)
W EC66 80
D EC62 100 "$OutputFile"
"@
    return $script
}

# Alternative: Direct EC read using RW command line
function Read-ECByte {
    param([int]$Offset)
    
    # RWEverything supports: Rw.exe /Command="R EC offset"
    $result = & $RwPath /Command="R EC $Offset" /Stdout 2>$null
    if ($result -match "0x([0-9A-Fa-f]+)") {
        return [Convert]::ToInt32($Matches[1], 16)
    }
    return $null
}

# Function to dump all EC registers using RW command line
function Get-ECDump {
    $dump = [byte[]]::new(256)
    
    # Method 1: Try bulk EC read
    $tempFile = [System.IO.Path]::GetTempFileName()
    
    try {
        # RWEverything bulk EC dump command
        & $RwPath /Command="D EC 0 100 `"$tempFile`"" /Min 2>$null | Out-Null
        Start-Sleep -Milliseconds 100
        
        if (Test-Path $tempFile) {
            $dump = [System.IO.File]::ReadAllBytes($tempFile)
            Remove-Item $tempFile -Force -ErrorAction SilentlyContinue
            return $dump
        }
    } catch {}
    
    # Method 2: Read byte by byte (slower but more reliable)
    Write-Host "Bulk read failed, trying byte-by-byte..." -ForegroundColor Yellow
    for ($i = 0; $i -lt 256; $i++) {
        $val = Read-ECByte -Offset $i
        if ($null -ne $val) {
            $dump[$i] = $val
        }
    }
    
    return $dump
}

# Function to compare two EC dumps
function Compare-ECDumps {
    param(
        [byte[]]$Old,
        [byte[]]$New
    )
    
    $changes = @()
    for ($i = 0; $i -lt 256; $i++) {
        if ($Old[$i] -ne $New[$i]) {
            $changes += [PSCustomObject]@{
                Offset = $i
                OldValue = $Old[$i]
                NewValue = $New[$i]
                OffsetHex = "0x{0:X2}" -f $i
                OldHex = "0x{0:X2}" -f $Old[$i]
                NewHex = "0x{0:X2}" -f $New[$i]
            }
        }
    }
    return $changes
}

# Function to display EC dump in hex format
function Show-ECDump {
    param([byte[]]$Dump)
    
    Write-Host "`n     00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F" -ForegroundColor Cyan
    Write-Host "     -----------------------------------------------" -ForegroundColor Cyan
    
    for ($row = 0; $row -lt 16; $row++) {
        $line = "{0:X2}:  " -f ($row * 16)
        for ($col = 0; $col -lt 16; $col++) {
            $line += "{0:X2} " -f $Dump[$row * 16 + $col]
        }
        Write-Host $line
    }
}

# Known register annotations
$KnownRegisters = @{
    0x73 = "FN_LOCK (bit2)"
    0xBC = "BATTERY_LIMIT"
    0xBE = "USB_CHARGING"
    0xC8 = "TEMP/TOUCHSCR"
    0xC9 = "TEMP2"
    0xCB = "FAN_RPM"
    0xCC = "FAN_MODE"
    0xCF = "SILENT_MODE"
    0xE0 = "KB_BACKLIGHT"
    0xE4 = "FN_KEY_CODE"
    0xEB = "KB_LED_STATE"
}

# Main monitoring loop
Write-Host "========================================" -ForegroundColor Green
Write-Host "  LG Gram EC Monitor" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "RWEverything Path: $RwPath"
Write-Host "Polling Interval: ${Interval}ms"
Write-Host ""
Write-Host "Press Ctrl+C to stop monitoring"
Write-Host ""

# Check if RW exists
if (-not (Test-Path $RwPath)) {
    Write-Host "ERROR: RWEverything not found at: $RwPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please specify the correct path:" -ForegroundColor Yellow
    Write-Host "  .\ec_monitor.ps1 -RwPath 'C:\Path\To\Rw.exe'" -ForegroundColor Yellow
    exit 1
}

# Create output directory if saving dumps
if ($SaveDumps) {
    New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

# Initial dump
Write-Host "Taking initial EC dump..." -ForegroundColor Yellow
$previousDump = Get-ECDump

if ($null -eq $previousDump -or $previousDump.Length -eq 0) {
    Write-Host "ERROR: Failed to read EC registers" -ForegroundColor Red
    Write-Host "Make sure RWEverything is running as Administrator" -ForegroundColor Yellow
    exit 1
}

Write-Host "Initial dump complete. Monitoring for changes..." -ForegroundColor Green
Show-ECDump -Dump $previousDump
Write-Host ""

$iteration = 0
try {
    while ($true) {
        Start-Sleep -Milliseconds $Interval
        $iteration++
        
        $currentDump = Get-ECDump
        $changes = Compare-ECDumps -Old $previousDump -New $currentDump
        
        if ($changes.Count -gt 0) {
            $timestamp = Get-Date -Format "HH:mm:ss.fff"
            Write-Host "`n[$timestamp] === CHANGES DETECTED ===" -ForegroundColor Yellow
            
            foreach ($change in $changes) {
                $annotation = ""
                if ($KnownRegisters.ContainsKey($change.Offset)) {
                    $annotation = " <- $($KnownRegisters[$change.Offset])"
                }
                
                Write-Host ("  Offset {0}: {1} -> {2}{3}" -f 
                    $change.OffsetHex, $change.OldHex, $change.NewHex, $annotation) -ForegroundColor Cyan
            }
            
            if ($SaveDumps) {
                $dumpFile = Join-Path $OutputDir ("ec_dump_{0:D6}.bin" -f $iteration)
                [System.IO.File]::WriteAllBytes($dumpFile, $currentDump)
                Write-Host "  Saved: $dumpFile" -ForegroundColor DarkGray
            }
        }
        
        $previousDump = $currentDump
        
        # Show heartbeat every 10 seconds
        if ($iteration % (10000 / $Interval) -eq 0) {
            Write-Host "." -NoNewline -ForegroundColor DarkGray
        }
    }
}
finally {
    Write-Host "`n`nMonitoring stopped." -ForegroundColor Yellow
}
