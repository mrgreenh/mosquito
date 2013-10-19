//
//  NOIRemoteSynth.m
//  BUH
//
//  Created by John Forester on 10/19/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOIRemoteSynth.h"
#import "NOINetworkingManager.h"

@interface NOIRemoteSynth ()

@end

@implementation NOIRemoteSynth

+ (void)playFrequency:(CGFloat)frequency filterFrequency:(CGFloat)filterFrequency wave:(NOIWaveType)wave
{
    NSDictionary *parameters = @{@"note"    : @(frequency),
                                 @"filter"  : @(filterFrequency),
                                 @"wave"    : @(wave),
                                 kUserParam : [[NSUserDefaults standardUserDefaults] objectForKey:kUserParam]};
    
    [[NOINetworkingManager sharedInstance] playWithParams:parameters];
}

+ (void)stopPlaying
{
    NSDictionary *parameters = @{@"note"    : @(-1),
                                 @"filter"  : @(-1),
                                 @"wave"    : @(0),
                                 kUserParam : [[NSUserDefaults standardUserDefaults] objectForKey:kUserParam]};
    
    [[NOINetworkingManager sharedInstance] playWithParams:parameters];
}

@end
