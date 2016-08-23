//
//  Header.h
//  WalkieTalkie
//
//  Created by IMAC on 2/8/16.
//  Copyright © 2016 Andrew Ng. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "VidTalk-Bridging-Header.h"
#import "AAPLCameraViewController.h"
#import "AAPLPreviewView.h"

@protocol AAPLCameraVCDelegate <NSObject>

-(void) shouldEnableRecordUI:(bool)enable;
-(void) shouldEnableCameraUI:(bool)enable;
-(void) canStartRecording;
-(void) recordingHasStarted;

-(void)videoRecordingComplete:(NSURL*)videoURL;
-(void)videoRecordingFailed;

-(void)snapshotTaken:(NSData*)snapshotData;
-(void)snapshotFailed;

@end


#endif /* Header_h */
