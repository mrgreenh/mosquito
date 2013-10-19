//
//  NOINetworkingManager.h
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOINetworkingManager : NSObject

+ (NOINetworkingManager *)sharedInstance;

- (void)playPitch:(NSNumber *)pitch filterCutoff:(NSNumber *)filterCutoff;
- (void)logInAsUser:(NSString *)userName;

@end
