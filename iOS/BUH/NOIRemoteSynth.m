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

+ (void)playFrequency:(CGFloat)frequency filterFrequency:(CGFloat)filterFrequency wave:(NOIWaveType)wave gain:(CGFloat)gain resonance:(CGFloat)resonance
{
    NSDictionary *parameters = @{@"pitch"    : @(frequency),
                                 @"filter"  : @(filterFrequency),
                                 @"wave"    : @(wave),
                                 @"gain"    : @(gain),
                                 @"q"       : @(resonance),
                                 kUserParam : [[NSUserDefaults standardUserDefaults] objectForKey:kUserParam]};
    
    [[NOINetworkingManager sharedInstance] playWithParams:parameters];
}

+ (void)stopPlaying
{
    NSDictionary *parameters = @{@"pitch"    : @(-1),
                                 @"filter"  : @(-1),
                                 @"wave"    : @(0),
                                 @"gain"    : @(0),
                                 kUserParam : [[NSUserDefaults standardUserDefaults] objectForKey:kUserParam]};
    
    [[NOINetworkingManager sharedInstance] playWithParams:parameters];
}

@end
