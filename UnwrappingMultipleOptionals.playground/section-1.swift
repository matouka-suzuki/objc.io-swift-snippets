// Playground - noun: a place where people can play

// Unwrapping Multiple Optionals
// http://www.objc.io/snippets/18.html

// This code works with Swift1.2

func login(email: String, pw: String, success: Bool -> ()){
    println("email => \(email)")
    println("password => \(pw)")
    if count(email) > 0 && count(pw) > 0{
        success(true)
    }else{
        success(false)
    }
}

func getPw() -> String?{
    //return nil
    return "password"
}

func getEmail() -> String?{
    // return nil
    return "hoge@gmail.com"
}

// unwrappiin multiple optionals
if let email = getEmail(), pw = getPw() { // new feature of Swift1.2
    login(email, pw){
        println("success: \($0)")
    }
}
