// Playground - noun: a place where people can play

// Typed Notification Observers
// http://www.objc.io/snippets/16.html

/* NSNotificationCenterへの登録と削除を自動的に行うようにする */

import Foundation

/**
*  Notificationを表現するstruct
*  :note AはPhantomTypeで、userInfoに入る
*/
struct Notification<A> {
    let name: String
}

class Box<T> {
    let unbox: T
    init(_ value: T){ self.unbox = value }
}


func postNotification<A>(note: Notification<A>, value: A){
    let userInfo = ["value" : Box(value)]
    let center = NSNotificationCenter.defaultCenter()
    center.postNotificationName(note.name, object: nil, userInfo: userInfo)
}

// ObserverObject
class NotificationObserver {
    let observer: NSObjectProtocol
    
    init<A>( notification: Notification<A>, block aBlock: A -> ()) {
        let center = NSNotificationCenter.defaultCenter()
        observer = center.addObserverForName(notification.name,object: nil, queue: nil) { note in
            if let value = (note.userInfo?["value"] as? Box<A>)?.unbox{
                aBlock(value)
            }
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}

// 以上で準備が整ったんのでNSErrorを持つglobalPanicNotificationという通知を作ってみます
let globalPanicNotification: Notification<NSError> = Notification(name: "Global Panic")

// 通知は簡単
let myError = NSError(domain: "io.objc.sample", code: 42, userInfo: [:])
postNotification(globalPanicNotification, myError)

// 監視
let panicObserver = NotificationObserver(notification: globalPanicNotification) { err in
    println(err.localizedDescription)
}