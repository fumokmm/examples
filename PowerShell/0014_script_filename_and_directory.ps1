# スクリプトファイル(.ps1)のパス
$scriptName1 = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName1

# スクリプトファイル(.ps1)のパス
$scriptName2 = Split-Path -Leaf $Script:MyInvocation.MyCommand.Path
Write-Host $scriptName2

# スクリプトファイル名
$scriptName3 = $Script:MyInvocation.MyCommand.Name
Write-Host $scriptName3

# スクリプトファイル(.ps1)がどのディレクトリに置かれているか
Write-Host $PSScriptRoot
Write-Host $Script:MyInvocation.MyCommand.Path # こちらはファイル名まで付いたフルパス
