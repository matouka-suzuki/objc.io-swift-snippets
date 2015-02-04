// Playground - noun: a place where people can play

// Flattening and mapping arrays
// http://www.objc.io/snippets/4.html

infix operator >>= {}
/**
子配列の配列を作って、子配列の要素を1つの配列でフラットにする

:param: xs 配列
:param: f  xs配列の要素を使って別の配列を返す関数

:returns: fで生成した配列を返却する
*/
func >>= <A, B>(xs: [A], f: A -> [B]) -> [B]{
    //return xs.map(f).reduce([], combine: +)
    
    // 配列xsの各要素にf関数を適応した配列（mapは配列を返す）
    let array = xs.map(f) // 配列[(rank,suit)]の配列が出来る（array of arrays）
    return array.reduce([], combine: +)
}

let ranks = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
let suits = ["♠", "♥", "♦", "♣"]

let allCards = ranks >>= { rank in
    suits >>= {suit in [(rank, suit)]}
}

// check steps
//let test = ranks >>= {rank in [(rank,1)]}
let test = ranks.map({rank in [(rank, 1)]})
println("test => \(test)")
let result = test.reduce([], combine: +)
println("result => \(result)")
