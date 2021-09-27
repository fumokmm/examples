// p1パッケージ
package p1

import "fmt"

func Fnc2() {
    fnc1() // 同一パッケージ内の関数を呼び出す
    fmt.Println("Fnc2")
}