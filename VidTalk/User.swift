//
//  User.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit

struct User {
    
    private var _firstName: String
    private var _uid: String
    
    var uid:String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init (uid: String, firstName: String) {
        self._uid = uid
        self._firstName = firstName
    }
    
    

    
    
    
}


