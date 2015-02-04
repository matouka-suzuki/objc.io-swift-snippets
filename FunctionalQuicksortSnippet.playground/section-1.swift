// Playground - noun: a place where people can play

// Functional Quicksort
//http://www.objc.io/snippets/3.html

// MARK: - Decomposit Snippet
// DecomposingArrayスニペットを使うのでまずは用意
extension Array{
    var decompose : (head: T, tail: [T])?{
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

// MARK: - Quicksort
func qsort(input: [Int]) -> [Int]{
    if let (pivot, rest) = input.decompose{
        let lesser = rest.filter{ $0 < pivot }
        let greater = rest.filter{ $0 >= pivot }
        return qsort(lesser) + [pivot] + qsort(greater)
    }else{
        return []
    }
}

// Test
let anArray = [100,10,9,1000,2,60534,500]
let sortedArray = qsort(anArray)

