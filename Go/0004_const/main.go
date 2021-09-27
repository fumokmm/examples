package main

import "fmt"

func main() {
	// 定数の定義
	const c1 string = "hoge"

	// 複数の定数定義
	var (
		c2 = 1
		c3 = c1
	)
	
	// 型を持つ定数と型を持たない定数どちらも宣言できる

	fmt.Println(c1, c2, c3) // => hoge 1 hoge
}
