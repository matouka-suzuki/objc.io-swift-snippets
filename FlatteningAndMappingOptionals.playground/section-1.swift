// Playground - noun: a place where people can play

// FlatteningAndMappingOptionals
// http://www.objc.io/snippets/14.html

let populations = ["Paris" : 2243, "Madrid" : 3216, "Amsterdam" : 881, "Berlin" : 3397]
let capitals = ["France": "Paris", "Spain" : "Madrid", "The Netherlands" : "Amsterdam", "Sweden" : "Stockholm"]

// 普通の実装
func populationOfCapital(country: String) -> Int?{
    if let capital = capitals[country] {
        return populations[capital]
    }
    return nil
}

// optionalにmap関数を使って実装する
// そうするとネストしたoptionalになってしまう。
func populationOfCaputal2(country: String) -> Int??{
    return capitals[country].map { populations[$0] }
}

// Optionalを返す関数をチェーンするときはflatmap関数を使うと便利です。
func flatMap<A, B>(x: A?, y: A -> B?) -> B? {
    if let value = x {
        return y(value)
    }
    return nil
}

// flatMap関数を使って実装する
func populationOfCapital3(country: String) -> Int?{
    return flatMap(capitals[country]) { populations[$0] }
}

let populationOfParis = populationOfCapital3("France")

/* 演算子で実装する場合　*/
infix operator >>= {}
func >>=<A, B>(xs: A?, f: A -> B?) -> B? {
    if let value = xs {
        return f(value)
    }
    return nil
}

func populationOfCapital4(country: String) -> Int? {
    return capitals[country] >>= { populations[$0] }
}

let populationOfMadrid = populationOfCapital4("Spain")