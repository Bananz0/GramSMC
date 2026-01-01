# Simple EC Register Reader for LG Gram
# Uses RWEverything via saved bin files
#
# USAGE:
# 1. Open RWEverything as Administrator
# 2. Go to "Access" menu -> "Embedded Controller"
# 3. Click "Read" to see current EC values
# 4. Use "File -> Save As" to save a .bin dump
# 5. Run this script to compare dumps
#
# Or use this script to compare existing dumps in your EC folder

param(
    [string]$DumpFolder = "C:\Users\glenm\OneDrive\Desktop\EC\LGC open"
)

Write-Host "========================================" -ForegroundColor Green
Write-Host "  LG Gram EC Dump Analyzer" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Known register annotations based on our analysis
$KnownRegisters = @{
    0x72 = "KBLV     - KB Backlight (0x80=Off, 0xA2=Low, 0xA4=High)"
    0x73 = "FNLK     - Fn Lock (0x04=off, 0x00=on)"
    0xBC = "BATLIM   - Battery Limit (0x50=80%, 0x64=100%)"
    0xBE = "USBCHG   - USB Charging (0x01=on, 0x00=off)"
    0xC8 = "TSR1     - CPU Temp (likely)"
    0xC9 = "TSR2     - Temp Sensor 2"
    0xCB = "FANRPM   - Fan RPM (raw value, *100=RPM)"
    0xCC = "DFAN     - Fan Mode (check if varies)"
    0xCF = "SILENT   - Silent Mode (0x11=on, 0x00=off)"
    0xE0 = "KBBL_OLD - Old KB Backlight (unused?)"
    0xE4 = "FNKN     - Fn Key Code"
    0xEB = "SLED     - KB LED State"
    # Battery data (dynamic)
    0x94 = "BATxx    - Battery voltage/current (dynamic)"
    0x95 = "BATxx    - Battery data (dynamic)"
    0x96 = "BATxx    - Battery data (dynamic)"
    0x98 = "BATxx    - Battery data (dynamic)"
    0x99 = "BATxx    - Battery data (dynamic)"
    0x9C = "BATxx    - Battery data (dynamic)"
    0x9D = "BATxx    - Battery data (dynamic)"
}

# Get all bin files
$binFiles = Get-ChildItem -Path $DumpFolder -Filter "*.bin" | Sort-Object Name

Write-Host "Found $($binFiles.Count) EC dumps in: $DumpFolder" -ForegroundColor Cyan
Write-Host ""

if ($binFiles.Count -lt 2) {
    Write-Host "Need at least 2 dumps to compare!" -ForegroundColor Yellow
    exit
}

# Read all dumps
$dumps = @{}
foreach ($file in $binFiles) {
    $dumps[$file.Name] = [System.IO.File]::ReadAllBytes($file.FullName)
    Write-Host "  Loaded: $($file.Name)" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  Register Diff Analysis" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

# Find all changing registers
$changingOffsets = @{}

$fileList = $binFiles | ForEach-Object { $_.Name }

for ($i = 0; $i -lt 256; $i++) {
    $values = @()
    foreach ($file in $fileList) {
        $values += $dumps[$file][$i]
    }
    $unique = $values | Sort-Object -Unique
    if ($unique.Count -gt 1) {
        $changingOffsets[$i] = $values
    }
}

# Display changing registers (excluding known dynamic ones)
$dynamicOffsets = @(0x94, 0x95, 0x96, 0x98, 0x99, 0x9C, 0x9D)

Write-Host "Registers that change between dumps:" -ForegroundColor Cyan
Write-Host "(Excluding battery/dynamic registers)" -ForegroundColor DarkGray
Write-Host ""
Write-Host ("Offset   " + ($fileList | ForEach-Object { $_.Replace("EC6662 ", "").Substring(0, 12).PadRight(14) }) -join "") -ForegroundColor White

foreach ($offset in ($changingOffsets.Keys | Sort-Object)) {
    if ($offset -in $dynamicOffsets) { continue }
    
    $line = "0x{0:X2}     " -f $offset
    $values = $changingOffsets[$offset]
    
    for ($i = 0; $i -lt $values.Count; $i++) {
        $line += "0x{0:X2}          " -f $values[$i]
    }
    
    $annotation = ""
    if ($KnownRegisters.ContainsKey($offset)) {
        $annotation = "  <- $($KnownRegisters[$offset])"
    }
    
    Write-Host "$line$annotation" -ForegroundColor $(if ($KnownRegisters.ContainsKey($offset)) { "Green" } else { "White" })
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  Quick Reference (Based on Your Dumps)" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""

# Create summary table
$summary = @"
| Feature          | Register | Off Value | On Value  | Notes                    |
|------------------|----------|-----------|-----------|--------------------------|
| Fn Lock          | 0x73     | 0x04      | 0x00      | Bit 2 controls it        |
| USB Charging     | 0xBE     | 0x00      | 0x01      | Direct byte write        |
| Battery Limit    | 0xBC     | 0x64      | 0x50      | 80% = 0x50, 100% = 0x64  |
| Silent Mode      | 0xCF     | 0x00      | 0x11      | 0x11 = silent enabled    |
| Touch Screen     | 0xC8     | 0x5A      | 0x59      | Bit 0 = enable           |
| Fan RPM          | 0xCB     | varies    | varies    | * 100 = approx RPM       |
| Keyboard BL      | 0xE0     | 0x00      | 0x00-0xFF | Brightness level         |
"@

Write-Host $summary

Write-Host ""
Write-Host "To discover more registers:" -ForegroundColor Cyan
Write-Host "1. Open RWEverything as Admin" -ForegroundColor White
Write-Host "2. Access -> Embedded Controller" -ForegroundColor White
Write-Host "3. Save baseline dump" -ForegroundColor White
Write-Host "4. Toggle a setting in LG Control Center" -ForegroundColor White
Write-Host "5. Save another dump" -ForegroundColor White
Write-Host "6. Run this script to see what changed!" -ForegroundColor White
