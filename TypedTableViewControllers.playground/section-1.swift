// Playground - noun: a place where people can play

// Typed Table View Controlers
// http://www.objc.io/snippets/21.html

import UIKit
import XCPlayground

// Specify a type to make sure that configuring function gets passed an element of the right type.
class MyTableViewController<A>: UITableViewController {
    
    var items: [A] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var configureCell: (UITableViewCell, A) -> () = { _ in ()}

    override init(style: UITableViewStyle) {
        super.init(style: style)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        configureCell(cell, items[indexPath.row])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

let tableViewController = MyTableViewController<String>(style: .Plain)

tableViewController.configureCell = { cell, string in
    cell.textLabel!.text = string
}

tableViewController.view.frame = CGRectMake(0, 0, 100, 100)

tableViewController.items = ["one", "two", "three"]

XCPShowView("tableView", tableViewController.view)




