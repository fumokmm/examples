# 値渡し
function byVal($arg) {
    $arg = 'Good bye!'
    Write-Host "in function(byVal): $arg"
}

# 参照渡し
function byRef([ref]$arg) {
    $arg.Value = 'Good bye!'
    Write-Host "in function(byRef): $($arg.Value)"
}
function byRef2($arg) {
    $arg.Value += '!!'
    Write-Host "in function(byRef2): $($arg.Value)"
}

$str = 'Hello'
$str
byVal $str  # 値渡し
$str  # => Hello のまま

byRef([ref]$str)　# 参照渡し
$str  # => Good bye! に書き換わっている
byRef2([ref]$str)　# 参照渡し
$str  # => Good bye!!! に書き換わっている
