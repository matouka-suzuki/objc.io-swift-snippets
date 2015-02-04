// Playground - noun: a place where people can play

// Reduce
// http://www.objc.io/snippets/5.html

let sum: [Int] -> Int = { $0.reduce(0, combine: +) }

let product: [Int] -> Int = { $0.reduce(1, combine: *) } // 積

let all: [Bool] -> Bool = { $0.reduce(true, combine: {$0 && $1}) }



let trueArray = [true,true,true]
let isAllTrue = all(trueArray)

let mixedArray = [true,true,false,true]
let isAllTrue2 = all(mixedArray)


