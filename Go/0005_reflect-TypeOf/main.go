package main

import (
	"fmt"
	"reflect"
)

func main() {
	n := 10
	var n16 int16 = 10
	fmt.Println(n, reflect.TypeOf(n))
	fmt.Println(n16, reflect.TypeOf(n16))
}
