<# 以下は、関数名の後と、Paramの両方で引数を指定しているので、
   「function の宣言に引数が指定されている場合、param ステートメントを使用できません。」
   というエラーになる。

function foo($hoge) {
    Param(
        $fuga
    )
    Write-Host $hoge
    Write-Host $fuga
}
#>

foo ほげ ふが
