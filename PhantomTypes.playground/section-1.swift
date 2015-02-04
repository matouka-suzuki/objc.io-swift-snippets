// Playground - noun: a place where people can play

// PhantomTypes
// http://www.objc.io/snippets/13.html

import Foundation

/* ファイルハンドルを持ったファイルを確実に読み取り専用で開きたいケースを考える */

// まずは1つのgenricパラメータをもってNSFileHandleをwrapする
struct FileHandle<A> {
    let handle: NSFileHandle
}

// 値レベルでは何もせず、型レベルだけで情報を記録する、2つの空のタイプを追加します。
struct Read{}
struct Write{}

// これら2つのタイプを使って更に2つのラッパーを作成します。
// Read,Writeを使います。FileHandleは2つのタイプを含んでいないのにも関わらず。
// 理由は、AパラメータはPhantomTypeと呼ばれるものだからです。
// これらのタイプはパーミッションをトラックする為だけにあるのです。

func openForReading(path: String) -> FileHandle<Read>? {
    // NSFileHandle()で作ったオブジェクトをFileHandleコンストラクタに入れてFileHandleオブジェクトを返す
    return NSFileHandle(forWritingAtPath: path).map { FileHandle(handle: $0) }
}

func openForWriting(path: String) -> FileHandle<Write>? {
    return NSFileHandle(forReadingAtPath: path).map { FileHandle(handle: $0) }
}


// こうすれば確実に書き込み/読み取りについての関数を定義することが出来ます
func readDataToEndOfFile(handle: FileHandle<Read>) -> NSData {
    return handle.handle.readDataToEndOfFile()
}

// 書き込み用FileHandleをreadData〜の引数に渡そうとするとコンパイルエラー
let writeHandle = openForWriting("somePath")
readDataToEndOfFile(writeHandle)

// [Memo]
// openForReading/Writingの戻り値で、<generic>指定すれば
// map内クロージャ内でFileHandle()する際に<genric>を意識する必要はない
let handle = openForReading("somePath")