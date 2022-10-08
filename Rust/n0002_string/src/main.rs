// ### Rustの文字列には&str型とString型がある
// - 文字列の扱いは所有権(ownership)や借用(borrow)を特に気をつけないといけない。
// - println!マクロを使ってコンソールに表示するだけなら、以下サンプルで十分。

// ステークホルダー{}を指定したprintln!の使用例
fn main_1() {
    let dog = "DOG";
    let cat = "CAT";
    println!("{} and {}", dog, cat);
}
// ＜出力結果＞
// DOG and CAT

// - ここで使われる方は&str型
// - letを使って変数を使う限りは特に気にする必要はありません。

// ### Rustの標準ライブラリ String型 を使う方法

fn main_2() {
    let s = String::from("Hello Rust!");
    println!("{}", s);
}
// ＜出力結果＞
// Hello Rust!

// - String型のfrom関数を使って文字列の初期化ができる。やっていることは&strと同じ。
// - String型にしておく理由は受け取った文字列を更新したいときに便利だから。

// 更新の例「＋」演算子
fn main_3() {
    let s1 = String::from("Hello");
    let s2 = String::from("Rust");
    let s3 = String::from("World.");
    let s = s1 + " " + &s2 + " " + &s3;
    println!("{}", s);
}
// ＜出力結果＞
// Hello Rust World.

// - s2とs3に&(アンパサンド)がついているのは借用の印。

// 実際はformat!マクロを使うと便利。
fn main_4() {
    let s1 = String::from("Hello");
    let s2 = String::from("Rust");
    let s3 = String::from("World.");
    let s = format!("{} {} {}", s1, s2, s3);
    println!("{}", s);
}
// ＜出力結果＞
// Hello Rust World.

// - format!マクロでは数値や文字列を連結して1つの文字列にして返してくれる。

// - String::from関数でなくて"ダブルクォートを使って直接文字列を代入する方法でもformat!マクロは使える。
fn main_5() {
    let s1 = "Hello";
    let s2 = "Rust";
    let s3 = "World.";
    let s = format!("{} {} {}", s1, s2, s3);
    println!("{}", s);
}
// ＜出力結果＞
// Hello Rust World.

// - Rustの文字列の扱いはUTF-8と配列がややこしく絡み合っているので結構注意が必要。
// - あまりややこしいことをしなければ、String::from関数とformat!マクロでそこそこまでいける。

// 以下、メイン処理
fn main() {
    main_1();
    main_2();
    main_3();
    main_4();
    main_5();
}
