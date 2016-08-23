//
//  UsersVC.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class UsersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var rightBarButtonItem: UIButton!
    
    private var users = [User]()
    
    private var selectedUsers = Dictionary<String, User>()
    
    private var _snapData: NSData?
    private var _videoURL: NSURL?
    
    var snapData: NSData? {
        set {
            _snapData = newValue
        } get {
            return _snapData
        }
    }
    
    var videoURL: NSURL? {
        set {
            _videoURL = newValue
        } get {
            return videoURL
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsMultipleSelection = true
        
        
        rightBarButtonItem.enabled = false
        
        
        DataService.instance.usersRef.observeSingleEventOfType(.Value) { (snapshot: FIRDataSnapshot) in
            
            

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
            
            self.tableView.reloadData()

        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! UserCell
        let user = users[indexPath.row]
        
        cell.updateUI(user)
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        rightBarButtonItem.enabled = true

        let cell = tableView.cellForRowAtIndexPath(indexPath) as! UserCell
        cell.setCheckmark(true)
        let user = users[indexPath.row]
        selectedUsers[user.uid] = user
        
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! UserCell
        cell.setCheckmark(false)
        let user = users[indexPath.row]
        
        selectedUsers[user.uid] = nil
        
        if selectedUsers.count <= 0 {
            rightBarButtonItem.enabled = false
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    

    
    
    @IBAction func sendPRBtnPressed(sender: AnyObject) {
        
        if let url = _videoURL {
            
            let videoName = "\(NSUUID().UUIDString)\(url)"
            let ref = DataService.instance.videoStorageRef.child(videoName)
            
             _ = ref.putFile(url, metadata: nil, completion: { (meta: FIRStorageMetadata?, err: NSError?) in
                
                if err != nil {
                    
                    print("Error uploading video" + "\(err?.localizedDescription)")
                    
                } else {
                    
                    let downloadURL = meta!.downloadURL()
                    DataService.instance.sendMediaPullRequest((FIRAuth.auth()?.currentUser?.uid)!, sendingTo: self.selectedUsers, mediaURL: downloadURL!, textSnippet: "test text snippet, write extra code to extend")
                    
                    print("Download URL" + "\(downloadURL)")
                    
                }
            })
            
            self.dismissViewControllerAnimated(true, completion: nil)

        
        } else if let snap = snapData {
            let ref = DataService.instance.imagesStorageRef.child("\(NSUUID().UUIDString).jpg")
            
            _ = ref.putData(snap, metadata: nil, completion: { (meta: FIRStorageMetadata?, err: NSError?) in
                
                if err != nil {
                    print ("error uploading snapsot " + "\(err?.localizedDescription)")
                } else {
                    let downloadURL = meta?.downloadURL()
                }
            })
            
            self.dismissViewControllerAnimated(true, completion: nil)

        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

}









