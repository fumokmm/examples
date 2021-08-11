Set-PSDebug -strict

# cf) https://powershellmagazine.com/2013/05/20/converting-to-size-units-kb-mbgbtb-and-pb-without-using-powershell-multipliers/
Write-Host "1KB = $(1KB.ToString('#,#'))バイト"
Write-Host "1MB = $(1MB.ToString('#,#'))バイト"
Write-Host "1GB = $(1GB.ToString('#,#'))バイト"
Write-Host "1TB = $(1TB.ToString('#,#'))バイト"
Write-Host "1PB = $(1PB.ToString('#,#'))バイト"
