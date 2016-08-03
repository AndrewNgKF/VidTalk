//
//  ViewController.swift
//  WalkieTalkie
//
//  Created by IMAC on 1/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate   {
    
    @IBOutlet weak var previewView: AAPLPreviewView!
    
    

    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var recordBtn: UIButton!

    override func viewDidLoad() {
        delegate = self
        
        self._previewView = previewView
        super.viewDidLoad()
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        performSegueWithIdentifier("LoginVC", sender: nil)

        
//        guard FIRAuth.auth()?.currentUser != nil else {
//            
//            performSegueWithIdentifier("LoginVC", sender: nil)
//            
//
//            
//            return
//            
//        }
        
    }
    
    
    
    
    
    
    @IBAction func recordBtnPressed(sender: AnyObject) {
        toggleMovieRecording()
        
    }
    
    @IBAction func changeCameraBtnPressed(sender: AnyObject) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(enable: Bool) {
        
        cameraBtn.enabled = enable
        print("should enable camera UI:\(enable)")
        
    }
    
    func shouldEnableRecordUI(enable: Bool) {
        recordBtn.enabled = enable
        print("should enable record UI: \(enable)")
    }
    
    func canStartRecording() {
        print("can start recording")
    }
    
    func recordingHasStarted() {
        print("recording has started")
    }
    
}

