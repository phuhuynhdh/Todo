//
//  AddItemViewController.swift
//  Todos
//
//  Created by Phu Huynh on 7/14/15.
//  Copyright (c) 2015 Phu Huynh. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate{
    func controller(controller: AddItemViewController, didAddItem: String)
}

class AddItemViewController: UIViewController {
    @IBOutlet var textField: UITextField?
    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.s
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func create(sender: UIButton){
        let item = self.textField!.text
        
        if let delegate = self.delegate {
            delegate.controller(self, didAddItem: item)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
