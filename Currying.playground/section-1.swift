// Playground - noun: a place where people can play

// Currying
// http://www.objc.io/snippets/6.html

func login(email: String, pw: String, success: Bool -> ()){
    println("email => \(email)")
    println("password => \(pw)")
    if countElements(email) > 0 && countElements(pw) > 0{
        success(true)
    }else{
        success(false)
    }
}

// Using Swift's special syntax for curried functions
func curriedLogin1(email: String)(pw: String)(success: Bool -> ()){
    
}

// 引数を3つ取り、1つの戻り値を返す関数をカリー化するジェネリック関数
// note: 関数は左から結合していくっぽい（ドキュメント未確認）
func curry<A, B, C, R>(f:(A, B, C) -> R) -> A -> B -> C -> R {
    return { a in { b in { c in f(a, b, c) } } }
}

// login関数を上記ジェネリック関数でカリー化
let curriedLogin2 = curry(login)
// まずは2つの引数を渡す
let f = curriedLogin2("foo")("bar")
// 最後の引数を渡すと、元々のlogin関数が評価される
f { println("success: \($0)") } // trailing closure

