// Playground - noun: a place where people can play

// 関数の結合スニペット
// http://www.objc.io/snippets/2.html

import Foundation

func getContents(url: String) -> String{
    let temp = NSURL(string: url)
    return NSString(contentsOfURL: temp!, encoding: NSUTF8StringEncoding, error: nil)!
}

func lines(input: String) -> [String]{
    return input.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

let linesInURL = {url in countElements(lines(getContents(url)))} // Closure
linesInURL("http://www.objc.io/books")


// MARK: - Snippet
infix operator >>> { associativity left }
/**
 >>>の左の関数の引数に、右の関数の返却値を使用する
:param: f 左辺
:param: g 右辺
:returns: 右辺の返却値を隠蔽した関数(A -> CだからBを隠蔽しているってか省略している)
:note Aは最初の引数、Bは右辺の戻り値、Cは最終的な戻り値
*/
func >>> <A,B,C>(f: B -> C, g: A -> B) -> A -> C{
    return { x in f(g(x)) }
}

let linesInURL2 = countElements >>> lines >>> getContents
linesInURL2("http://www.objc.io/books")

let lines2 = lines >>> getContents
let numberOfLines = countElements >>> lines2
numberOfLines("http://www.objc.io/books")