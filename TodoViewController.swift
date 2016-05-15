//
//  TodoViewController.swift
//  ToDoListTwo
//
//  Created by Jidde Koekoek on 13/05/16.
//  Copyright © 2016 Jidde Koekoek. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTodo(sender: AnyObject) {
        
//        TodoManager.sharedInstance.writeTodo(titleField.text!, completed: false, picture: "", duration: 1, backgroundColor: "", inProgress: true, description: "", rowNumber: 0)
        
        dismissViewControllerAnimated(true, completion: nil)
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
