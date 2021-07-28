# ファイルコピー
# Copy-Item -Path <コピー元パス> -Destination <コピー先パス>
# Copy-Item -Path <コピー元パス> -Destination <コピー先パス> -Force
# ref. https://www.fenet.jp/infla/column/engineer/powershell%E3%81%A7%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%82%92%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%A8%E3%81%AF%EF%BC%9Fpowershell%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9/
Copy-Item -Path C:\temp\test.txt -Destination C:\temp\test2.txt
# -Forceは上書き
Copy-Item -Path C:\temp\test.txt -Destination C:\temp\test3.txt -Force
