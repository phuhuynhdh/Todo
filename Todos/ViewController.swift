//
//  ViewController.swift
//  Todos
//
//  Created by Phu Huynh on 7/14/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    @IBOutlet var tableView: UITableView!
    var items: [String] = []
    var checkItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = ["Milk", "Meat", "Fish", "Chickend"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! UITableViewCell
        
        tableViewCell.textLabel!.text = item
        
        if contains( self.checkItems, item){
            tableViewCell.accessoryType = .Checkmark
        }else{
            tableViewCell.accessoryType = .None
        }
        
        return tableViewCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItemViewController"{
            // Get navigation controller
            let navigationController = segue.destinationViewController as! UINavigationController
            var addItemViewController = navigationController.topViewController as! AddItemViewController
            addItemViewController.delegate = self
            
        }
    }
    
    func controller(controller: AddItemViewController, didAddItem: String) {
        // Add new item to item array
        self.items.append(didAddItem)
        
        // Reload tableview
        self.tableView.reloadData()
        
        // Dimiss AddItemViewController view
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            let item = self.items[indexPath.row]
            
            // Remove at index path for items property
            self.items.removeAtIndex(indexPath.row)
            
            // Remove row in tableview
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
            
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // get selected item
        let item = self.items[indexPath.row]
        
        // get selected cell
        var tableViewCell = tableView.cellForRowAtIndexPath(indexPath)
        
        // Find index of item
        var index = find(self.checkItems, item)
        
        if let index = index {
            // Remove checkmark
            tableViewCell?.accessoryType = .None
            
            // Remove item in checkItems
            self.checkItems.removeAtIndex(index)
        }else{
            // Add checkmark
            tableViewCell?.accessoryType = .Checkmark
            // Append item to checkItems
            self.checkItems.append(item)
        }
    }
}

