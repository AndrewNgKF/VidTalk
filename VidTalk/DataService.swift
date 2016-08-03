//
//  DataService.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//



import Foundation
import FirebaseDatabase

// Singleton to persist data to Firebase

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        
        return FIRDatabase.database().reference()
        
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
        
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "", "lastName" : ""]
        
        mainRef.child("users").child(uid).child("profile").setValue(profile)
        
    }
    
    
    
    
}