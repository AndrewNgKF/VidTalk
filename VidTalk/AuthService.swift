//
//  AuthService.swift
//  VidTalk
//
//  Created by IMAC on 3/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (errMsg: String?, data: AnyObject?) -> Void


class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
            
            if error != nil {
                
                if let errorCode = FIRAuthErrorCode(rawValue: error!.code) {
                    
                    if errorCode == FIRAuthErrorCode.ErrorCodeUserNotFound {
                        
                        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
                            
                            if error != nil {
                                
                                self.handleFirebaseError(error!, onComplete: onComplete)
                                
                            }else {
                                if user?.uid != nil {
                                    
                                    FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            
                                            self.handleFirebaseError(error!, onComplete: onComplete)

                                            
                                        } else {
                                            
                                            onComplete(errMsg: nil, data: user)
                                            
                                        }
                                    })
                                }
                            }
                        })
                    }
                    
                } else {
                    
                    self.handleFirebaseError(error!, onComplete: onComplete)
                    
                }
            } else {
                
                onComplete(errMsg: nil, data: user)
                
            }
        })
    }
    
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        
        print (error.debugDescription)
        
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            
            switch (errorCode) {
            case .ErrorCodeInvalidEmail:
                onComplete?(errMsg:"Invalid email address", data: nil)
                break
            case .ErrorCodeWrongPassword:
                onComplete?(errMsg:"Invalid password", data: nil)
                break
            case .ErrorCodeEmailAlreadyInUse:
                onComplete?(errMsg:"Email already in use", data: nil)
                break
            case .ErrorCodeAccountExistsWithDifferentCredential:
                onComplete?(errMsg:"Email already in use", data: nil)
                break
            default:
                onComplete?(errMsg:"There was a problem authenticating. try again", data: nil)
            }
        }
    }
    
    
    
    
}