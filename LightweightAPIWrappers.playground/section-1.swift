// Playground - noun: a place where people can play

// Lightweight API Wrapper
// http://www.objc.io/snippets/11.html

import Foundation

typealias JSONDictionary = [String : AnyObject]

func decodeJSON(data: NSData) -> JSONDictionary? {
    return NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil) as? JSONDictionary
}

func encodeJSON(input: JSONDictionary) -> NSData? {
    return NSJSONSerialization.dataWithJSONObject(input, options: .allZeros, error: nil)
}