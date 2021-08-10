Set-PSDebug -strict

# エスケープシーケンス \n を改行コードへ変換
$esc = "aaa\nbbb\nccc"
Write-Host "1: $($esc)"
$esc2 = $esc -replace '\\n', "`r`n"
Write-Host "2: $($esc2)"

# 改行コード \n をエスケープシーケンスへ変換
$crlf = @"
aaa
bbb
ccc
"@
Write-Host "3: $($crlf)"
$crlf2 = $crlf -replace "`r`n", "\n"
Write-Host "4: $($crlf2)"
