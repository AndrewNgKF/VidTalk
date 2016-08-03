//
//  DataService.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//



import Foundation
import FirebaseDatabase
import FirebaseStorage

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
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().referenceForURL("gs://vidtalk-adc15.appspot.com")
    }
    
    
    
    
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    
    
    
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "", "lastName" : ""]
        
        mainRef.child("users").child(uid).child("profile").setValue(profile)
        
    }
    
    
    
    
}