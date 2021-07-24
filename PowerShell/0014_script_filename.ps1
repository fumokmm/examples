# スクリプトファイル(.ps1)のパス
$scriptName1 = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName1

# スクリプトファイル(.ps1)のパス
$scriptName2 = Split-Path -Leaf $Script:MyInvocation.MyCommand.Path
Write-Host $scriptName2

# スクリプトファイル名
$scriptName3 = $Script:MyInvocation.MyCommand.Name
Write-Host $scriptName3
