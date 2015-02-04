// Playground - noun: a place where people can play

// Map for Optionals
// http://www.objc.io/snippets/9.html

import Foundation
import UIKit

// UIImageにcontentsOfURLがないのでとりあえずextensionde定義
extension UIImage{
    class func contentsOfURL(url: NSURL) -> UIImage?{
        return nil
    }
}

// map関数は配列にtransform関数を各要素に適用して同サイズの新しい配列に変換します
let urls: [NSURL] = [ /* a bunch of image URLs */ ]
let images: [UIImage?] = urls.map { UIImage.contentsOfURL($0) }

class someClass{
    // map関数はArrayだけのものではなく、より抽象的なレベルにあり
    // ContainerTypeから値をunwrapして変換を適用して再度wrapします
    // 標準ライブラリでそうなっていますが、簡単に自分で書くことができます。
    func map<A, B>(x: A?, f: A -> B) -> B? {
        if let x1 = x {
            return f(x1)
        }
        return nil
    }

    // Optional bindingを使った例
    func optionalBindingExample(){
        let url: NSURL? = NSURL(string: "image.png")
        var image: UIImage?
        if let url1 = url {
            image = UIImage.contentsOfURL(url1)
        }
    }

    // OptionalBindingを使うよりエレガントに書けます
    func mapExample(){
        let url: NSURL? = NSURL(string: "image.png")
        let image = map(url) { UIImage.contentsOfURL($0) }
    }
}