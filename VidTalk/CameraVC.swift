//
//  ViewController.swift
//  WalkieTalkie
//
//  Created by IMAC on 1/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

import UIKit

class CameraVC: AAPLCameraViewController, AAPLCameraVCDelegate   {
    
    @IBOutlet weak var previewView: AAPLPreviewView!
    
    

    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var recordBtn: UIButton!

    override func viewDidLoad() {
        delegate = self
        
        self._previewView = previewView
        super.viewDidLoad()
        
    }
    
    
    @IBAction func recordBtnPressed(_ sender: AnyObject) {
        toggleMovieRecording()
        
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: AnyObject) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        
        cameraBtn.isEnabled = enable
        print("should enable camera UI:\(enable)")
        
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("should enable record UI: \(enable)")
    }
    
    func canStartRecording() {
        print("can start recording")
    }
    
    func recordingHasStarted() {
        print("recording has started")
    }
    
}

