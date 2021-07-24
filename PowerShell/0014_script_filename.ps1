# スクリプトファイル(.ps1)のパス
$scriptName = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName

# スクリプトファイル名
$scriptName = $Script:MyInvocation.MyCommand.Name
Write-Host $scriptName
