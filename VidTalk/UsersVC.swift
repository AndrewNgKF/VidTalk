//
//  UsersVC.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [User]()

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsMultipleSelection = true
        
        
        
        DataService.instance.usersRef.observeSingleEventOfType(.Value) { (snapshot: FIRDataSnapshot) in
            
            
            //parse the data
            if let users = snapshot.value as? Dictionary<String, AnyObject> {
                for (key, value) in users {
                    if let dict = value as? Dictionary<String, AnyObject> {
                        if let profile = dict["profile"] as? Dictionary<String, AnyObject> {
                            if let firstName = profile["firstName"] as? String {
                                let uid = key
                                let user = User(uid: uid, firstName: firstName)
                                
                                self.users.append(user)
                            }
                        }
                        
                    }
                }
            }
            
        }
        
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    

}
