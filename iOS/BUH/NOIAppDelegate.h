//
//  NOIAppDelegate.h
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheAmazingAudioEngine.h"

@interface NOIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AEAudioController *audioController;

@end
