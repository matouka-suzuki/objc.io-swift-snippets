// Playground - noun: a place where people can play

// Permutations
// http://www.objc.io/snippets/10.html


/* Decompose Snippet
   http://www.objc.io/snippets/1.html
*/
extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

/* Flattening and mapping arrays
   http://www.objc.io/snippets/4.html
*/
infix operator >>= {}
func >>=<A, B>(xs: [A], f: A -> [B]) -> [B] {
    return xs.map(f).reduce([], combine: +)
}

// MARK: -

func between<T>(x: T, ys: [T]) -> [[T]]{
    if let (head, tail) = ys.decompose {
        return [[x] + ys] + between(x, tail).map { [head] + $0 }
    } else {
        return [[x]]
    }
}

let array = between(0, [1, 2, 3])


func permutations<T>(xs: [T]) -> [[T]] {
    if let (head, tail) = xs.decompose {
        return permutations(tail) >>= { permTail in
            between(head, permTail)
        }
    } else {
        return [[]]
    }
}

let permtationList = permutations([1,2,3])