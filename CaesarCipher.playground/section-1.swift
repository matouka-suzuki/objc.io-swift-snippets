// Playground - noun: a place where people can play

// CaesarCipher
// http://www.objc.io/snippets/17.html

func mapScalarValues(s: String, f:UInt32 -> UInt32) -> String {
    let scalars = Array(s.unicodeScalars)
    let encrypted = scalars.map{ x in Character(UnicodeScalar(f(x.value))) }
    return String(encrypted)
}

func caeser(plainText: String) -> String {
    return mapScalarValues(plainText) { (x: UInt32) in x + 7}
}

let abc = "abc"
let encrypted = caeser(abc)

// ROT-13
func rot13(plainText: String) -> String {
    let A: UInt32 = 65
    let Z: UInt32 = 90
    return mapScalarValues(plainText) { x in
        if x >= A && x <= Z {
            return A + ((x + 13) % 26)
        }
        return x
    }
}