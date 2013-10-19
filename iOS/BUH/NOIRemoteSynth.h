//
//  NOIRemoteSynth.h
//  BUH
//
//  Created by John Forester on 10/19/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NOIWaveType) {
    NOIWaveTypeSine,
    NOIWaveTypeTri,
    NOIWaveTypeSaw,
    NOIWaveTypeSquare,
};

@interface NOIRemoteSynth : NSObject

@property (nonatomic, assign) NOIWaveType waveType;

+ (void)playFrequency:(CGFloat)frequency filterFrequency:(CGFloat)filterFrequency wave:(NOIWaveType)wave gain:(CGFloat)gain resonance:(CGFloat)resonance;
+ (void)stopPlaying;

@end
