# 可変長引数
function foo {
    Write-Host $args.Count
    foreach($i in $args) {
        Write-Host $i
    }
}

function bar($a, $b) {
    Write-Host "$($args.Count) a=$a b=$b"
    foreach($i in $args) {
        Write-Host $i
    }
}

# 呼び出し
Write-Host '--- call foo'
foo a b あいう
Write-Host '--- call bar 1'
bar 10 20 a b c あいう  # $a, $bに10, 20が割り当てられ、それ以降が$argsに割り当てられる
Write-Host '--- call bar 2'
bar 10 20  # $a, $bに10, 20が割り当てられ、$argsには何も割り当てられず空リストになる
