# Comprehensive EC Dump Analyzer
# Analyzes multiple EC dump folders, groups similar states, and finds consensus values

param(
    [string[]]$Folders = @(
        "C:\Users\glenm\OneDrive\Desktop\EC\LGC open",
        "C:\Users\glenm\OneDrive\Desktop\attempt2"
    )
)

Write-Host "========================================" -ForegroundColor Green
Write-Host "  Comprehensive EC Dump Analyzer" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Load all dumps from all folders
$allDumps = @{}
foreach ($folder in $Folders) {
    Write-Host "Loading from: $folder" -ForegroundColor Cyan
    $files = Get-ChildItem -Path $folder -Filter "*.bin" -ErrorAction SilentlyContinue
    foreach ($file in $files) {
        $key = "$($file.Directory.Name)/$($file.Name)"
        $allDumps[$key] = [System.IO.File]::ReadAllBytes($file.FullName)
        Write-Host "  Loaded: $key" -ForegroundColor DarkGray
    }
}

Write-Host "`nTotal dumps loaded: $($allDumps.Count)" -ForegroundColor Yellow
Write-Host ""

# Define state groups based on filename patterns
$stateGroups = @{
    'KBL_OFF'          = @('kbl off', 'kbl.*off')
    'KBL_LOW'          = @('kbl low', 'kbl.*low')
    'KBL_HIGH'         = @('kbl high', 'kbl.*high')
    'BATTERY_80'       = @('battery.*enabled', 'extend.*enabled', 'battery.*80')
    'BATTERY_100'      = @('battery.*disabled', 'extend.*disabled', 'battery.*100')
    'USB_CHG_ON'       = @('usb.*charging.*on', 'usb.*charging.*enabled', 'usb.*charging back')
    'USB_CHG_OFF'      = @('usb.*charging.*off', 'usb.*charging.*disabled')
    'SILENT_ON'        = @('silent.*on', 'silent.*enabled')
    'SILENT_OFF'       = @('silent.*off', 'silent.*disabled')
    'FN_LOCK_ON'       = @('fn.*enabled', 'fn.*on', 'fn key mode enabled')
    'FN_LOCK_OFF'      = @('fn.*disabled', 'fn.*off', 'fn.*disnabled')
    'TOUCHPAD_ON'      = @('touchpad.*enabled')
    'TOUCHPAD_OFF'     = @('touchpad.*disabled')
    'TOUCHSCREEN_ON'   = @('touch screen.*enabled')
    'TOUCHSCREEN_OFF'  = @('touch screen.*disabled')
    'INSTANT_BOOT_ON'  = @('instant.*on', 'instant.*booting set to on')
    'INSTANT_BOOT_OFF' = @('instant.*off', 'instant.*booting set to off')
    'BASELINE'         = @('baseline', 'base\.bin')
}

# Group dumps by state
$groupedDumps = @{}
foreach ($state in $stateGroups.Keys) {
    $groupedDumps[$state] = @()
    foreach ($dumpKey in $allDumps.Keys) {
        foreach ($pattern in $stateGroups[$state]) {
            if ($dumpKey -imatch $pattern) {
                $groupedDumps[$state] += $dumpKey
                break
            }
        }
    }
}

# Display group counts
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  State Groups" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
foreach ($state in $groupedDumps.Keys | Sort-Object) {
    Write-Host ("{0,-20} : {1} samples" -f $state, $groupedDumps[$state].Count) -ForegroundColor Cyan
}

# Function to find consensus values for a group (values that are same across all samples)
function Get-ConsensusBytes {
    param([string[]]$DumpKeys)
    
    if ($DumpKeys.Count -eq 0) { return $null }
    
    $consensus = @{}
    
    # For each byte offset
    for ($i = 0; $i -lt 256; $i++) {
        $values = @()
        foreach ($key in $DumpKeys) {
            $values += $allDumps[$key][$i]
        }
        
        # If all values are the same, it's consensus
        $unique = $values | Sort-Object -Unique
        if ($unique.Count -eq 1) {
            $consensus[$i] = $unique[0]
        }
    }
    
    return $consensus
}

# Find consensus for each group
Write-Host "`n========================================" -ForegroundColor Yellow
Write-Host "  Finding Consensus Values per Group" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow

$consensusData = @{}
foreach ($state in $groupedDumps.Keys) {
    if ($groupedDumps[$state].Count -gt 0) {
        $consensusData[$state] = Get-ConsensusBytes -DumpKeys $groupedDumps[$state]
        $count = $consensusData[$state].Count
        Write-Host ("{0,-20} : {1} consensus bytes (out of 256)" -f $state, $count) -ForegroundColor DarkGray
    }
}

# Compare related groups to find differing registers
Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  REGISTER ANALYSIS" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

function Compare-States {
    param(
        [string]$Name,
        [string]$State1,
        [string]$State2
    )
    
    if (-not $consensusData[$State1] -or -not $consensusData[$State2]) {
        return
    }
    
    Write-Host "`n--- $Name ---" -ForegroundColor Cyan
    
    $differences = @()
    for ($i = 0; $i -lt 256; $i++) {
        if ($consensusData[$State1].ContainsKey($i) -and 
            $consensusData[$State2].ContainsKey($i) -and
            $consensusData[$State1][$i] -ne $consensusData[$State2][$i]) {
            
            $differences += [PSCustomObject]@{
                Offset    = $i
                OffsetHex = "0x{0:X2}" -f $i
                State1Val = "0x{0:X2}" -f $consensusData[$State1][$i]
                State2Val = "0x{0:X2}" -f $consensusData[$State2][$i]
            }
        }
    }
    
    if ($differences.Count -eq 0) {
        Write-Host "  No consensus differences found!" -ForegroundColor Red
        return
    }
    
    Write-Host ("  Offset | {0,-15} | {1,-15}" -f $State1, $State2) -ForegroundColor White
    Write-Host "  -------|------------------|------------------"
    foreach ($diff in $differences) {
        $annotation = ""
        switch ($diff.Offset) {
            0x72 { $annotation = "  <- KBLV (Keyboard Backlight)" }
            0x73 { $annotation = "  <- FNLK (Fn Lock)" }
            0xBC { $annotation = "  <- BATLIM (Battery Limit)" }
            0xBE { $annotation = "  <- USBCHG (USB Charging)" }
            0xCF { $annotation = "  <- SILENT (Silent Mode)" }
        }
        Write-Host ("  {0,-6} | {1,-16} | {2,-16}{3}" -f $diff.OffsetHex, $diff.State1Val, $diff.State2Val, $annotation)
    }
}

# Perform comparisons
Compare-States "Keyboard Backlight: OFF vs LOW" "KBL_OFF" "KBL_LOW"
Compare-States "Keyboard Backlight: LOW vs HIGH" "KBL_LOW" "KBL_HIGH"
Compare-States "Battery Limit: 100% vs 80%" "BATTERY_100" "BATTERY_80"
Compare-States "USB Charging: OFF vs ON" "USB_CHG_OFF" "USB_CHG_ON"
Compare-States "Silent Mode: OFF vs ON" "SILENT_OFF" "SILENT_ON"
Compare-States "Fn Lock: OFF vs ON" "FN_LOCK_OFF" "FN_LOCK_ON"
Compare-States "Touchpad: OFF vs ON" "TOUCHPAD_OFF" "TOUCHPAD_ON"
Compare-States "Touch Screen: OFF vs ON" "TOUCHSCREEN_OFF" "TOUCHSCREEN_ON"
Compare-States "Instant Boot: OFF vs ON" "INSTANT_BOOT_OFF" "INSTANT_BOOT_ON"

# Summary table
Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  CONFIRMED REGISTER MAP" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

$registerMap = @(
    [PSCustomObject]@{ Offset = "0x72"; Name = "KBLV"; Feature = "Keyboard Backlight"; Off = "0x80"; On = "0xA2/0xA4"; Notes = "0x80=Off, 0xA2=Low, 0xA4=High" }
    [PSCustomObject]@{ Offset = "0x73"; Name = "FNLK"; Feature = "Fn Lock"; Off = "0x04"; On = "0x00"; Notes = "Inverted logic" }
    [PSCustomObject]@{ Offset = "0xBC"; Name = "BATLIM"; Feature = "Battery Care Limit"; Off = "0x64"; On = "0x50"; Notes = "0x64=100%, 0x50=80%" }
    [PSCustomObject]@{ Offset = "0xBE"; Name = "USBCHG"; Feature = "USB Always-On Charging"; Off = "0x00"; On = "0x01"; Notes = "Boolean" }
    [PSCustomObject]@{ Offset = "0xCF"; Name = "SILENT"; Feature = "Silent Mode"; Off = "0x00"; On = "0x11"; Notes = "0x11 = Silent enabled" }
)

$registerMap | Format-Table -AutoSize

Write-Host "`nAnalysis complete!" -ForegroundColor Green
Write-Host "Total unique dumps analyzed: $($allDumps.Count)" -ForegroundColor Cyan
