// Playground - noun: a place where people can play

// ApplocativeFunctors
//http://www.objc.io/snippets/7.html

// MARK: - 前回のCurringのコード

func curry<A, B, C, R>(f:(A, B, C) -> R) -> A -> B -> C -> R {
    return { a in { b in { c in f(a, b, c) } } }
}

func login(email: String, pw: String, success: Bool -> ()){
    println("email => \(email)")
    println("password => \(pw)")
    if countElements(email) > 0 && countElements(pw) > 0{
        success(true)
    }else{
        success(false)
    }
}

// MARK: - 今回のコード
func getPw() -> String?{
    //return nil
    return "password"
}

func getEmail() -> String?{
    // return nil
    return "hoge@gmail.com"
}


// EmailとPWを使って何かする関数
// getEmailとgetPwの戻り値がOptionalだと冗長な判定式になってしまう・・・
func someFunc(){
    if let email = getEmail() {
        if let pw = getPw() {
            login(email,pw){ println("success: \($0)") }
        } else {
            // Error...
        }
    } else {
        // Error...
    }
}

// MARK: Applicative Functorとして <*>演算子 を定義する
infix operator <*> { associativity left precedence 150}
func <*><A, B>(lhs: (A -> B)?, rhs: A?) -> B? {
    if let lhs1 = lhs {
        if let rhs1 = rhs {
            return lhs1(rhs1)
        }
    }
    return nil
}

// MARK: login関数をカリー化して<*>も適用

// カリー化した関数に左(associativity left)から引数を入れていく
if let f = curry(login) <*> getEmail() <*> getPw() {
    f { println("success: \($0)") }
} else {
    // Error..
}

// Associativity left
let curried = curry(login)
let email = curried <*> getEmail()
let pw = email <*> getPw()



