$filesize = 2MB

if ($filesize -lt 1MB) {
    Write-Host "1MBより小さい"
} elseif ($filesize -lt 2MB) {
    Write-Host "2MBより小さい"
} else {
    Write-Host "2MB以上"
}
