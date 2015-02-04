// Playground - noun: a place where people can play

// Wrapper Types
// http://www.objc.io/snippets/8.html

class Account{
    
}

// サーバーから取得したInt型変数を
// typealiasで名前付けするよりstructでletにすることで、変更に対してwarningを出せる
// また、為替などを扱う場合にも拡張性がある。

func credits(account: Account) -> Credits{
    return Credits(amount: 100)
}

struct Credits {
    let amount: Int
}

