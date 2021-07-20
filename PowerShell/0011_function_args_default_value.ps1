# デフォルト値
function foo($arg = 10) {
    Write-Host "値は$($arg)です。"
}
function bar($arg1, $arg2 = 10) {
    Write-Host "値は$($arg1)と$($arg2)です。"
}

foo
foo 20

bar 15
bar 15 25