// Playground - noun: a place where people can play

// Typed TableViewControllers Redux
// http://www.objc.io/snippets/22.html

import UIKit

class Box<T> {
    let unbox: T
    init(_ value: T){ self.unbox = value }
}

class MyTableViewController: UITableViewController {
    var items: [Any] = []
    var configureCell: (UITableViewCell, Any) -> () = { _ in }
    let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension MyTableViewController: UITableViewDataSource {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell
        configureCell(cell, items[indexPath.row])
        return cell
    }
}

// TypedTableViewController生成用wrapper
func exampleTableViewController<A>(items: [A], configure: (UITableViewCell, A) -> ()) -> UITableViewController {
    let vc = MyTableViewController(style: .Plain)
    vc.items = items.map{ Box($0) }     // Any配列では型が安全ではないので、Box<T>で同じサイズの配列を作ることで型でラップ
    vc.configureCell = { cell, obj in
        if let value = obj as? Box<A> { // configureCellも第2引数がAnyなのでasで型チェック
            configure(cell, value.unbox)
        }
    }
    return vc
}