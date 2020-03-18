# 注意、utf-8 としていますが、エンコーディングはutf-8 BOM付きになるよ
# https://qiita.com/watahani/items/3cb6a9d00d5dc1e2ba73
$OutputEncoding = 'utf-8'

Write-Host 'Hello, World (ホストのみ)'
Write-Output 'Hello, World (標準出力へ)'
Write-Error 'Hello, World (標準エラーへ)'

#
# 実行例 (リダイレクトすると UTF-16 LEになるのなんとかならんかな…)
#
# PS C:\workspace\language-examples\PowerShell> .\0002_hello-world.ps1 1>out1.txt 2>out2.txt
# Hello, World (ホストのみ)
#
#
# out1.txt [UTF-16 LE]
# --------------------
# Hello, World (標準出力へ)
#
#
# out2.txt [UTF-16 LE]
# --------------------
# C:\workspace\language-examples\PowerShell\0002_hello-world.ps1 : Hello, World (標準エラーへ)
# 発生場所 行:1 文字:1
# + .\0002_hello-world.ps1 1>out1.txt 2>out2.txt
# + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
#     + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,0002_hello-world.ps1
# 