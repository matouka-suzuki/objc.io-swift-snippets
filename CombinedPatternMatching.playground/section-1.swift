// Playground - noun: a place where people can play

// Combined pattern-matching
// http://www.objc.io/snippets/15.html

/* Optional型の比較をする */

// 冗長な実装
/*
func ==<A: Equatable>(l: A?, r:A?) -> Bool {
    switch l {
    case .Some(let x):
        switch r {
        case .Some(let y): return x == y
        case .None: return false
        }
    case .None:
        switch r {
        case .None: return true
        case .Some(_): return false
        }
    }
}
*/

// ネストがないシンプルな実装
func ==<A: Equatable>(l: A?, r: A?) -> Bool {
    switch (l,r) {
    case let (.Some(x), .Some(y)): return x == y
    case (.None, .None): return true
    default: return false
    }
}
