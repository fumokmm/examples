package main

import "fmt"

// 単一の変数宣言
var a int // 初期値の指定なし
var b int = 10 // 初期値の指定あり
var c = 0 // 型を省略

// 複数の変数宣言
var (
	d int
	e int = 10
	f = 0
)

var a1, a2 int
var b1, b2 int = 0, 1
var c1, c2 = 0, 1

// ローカルスコープの変数
func main() {
	g := 1
	h, i := 2, 3
	var j int = 20
	fmt.Println(g, h, i, j)
}
