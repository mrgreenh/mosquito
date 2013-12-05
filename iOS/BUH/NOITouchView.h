//
//  NOITouchView.h
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NOIRemoteSynth.h"

@protocol NOITouchViewDelegate <NSObject>

- (NOIWaveType)waveType;
- (CGFloat)gain;
- (CGFloat)resonance;

@end

@interface NOITouchView : UIView

@property (nonatomic, assign) id<NOITouchViewDelegate> delegate;

@end
