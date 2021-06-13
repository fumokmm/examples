# テキストファイルの書き込み
$str = @'
aaaaa
あああああ
1234567890
'@

# 通常の使い方、-Pathで出力先を指定し、 -Value で出力する内容を指定する
Set-Content -Path C:\temp\out.txt -Value $str

# -Value は省略可
Set-Content -Path C:\temp\out2.txt $str

# -Value はパイプラインでも受け取り可
Get-ChildItem C:\temp | Set-Content -Path C:\temp\out3.txt

## 参考
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-content?view=powershell-7.1

