//
//  NOITouchView.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOITouchView.h"
#import "NOINetworkingManager.h"
#import "NOIRemoteSynth.h"
#import "NOIEmitterView.h"

#define MIN_FREQ 440
#define MAX_FREQ 2000

#define MIN_FILT 1000
#define MAX_FILT 300

@interface NOITouchView ()

@property (nonatomic, strong) CAShapeLayer *fingerSquare;
@property (nonatomic, strong) NOIEmitterView *emitterView;

@end

@implementation NOITouchView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _fingerSquare = [CAShapeLayer layer];
        _fingerSquare.frame = CGRectMake(0, 0, 50, 50);
        _fingerSquare.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.7].CGColor;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (_emitterView == nil) {
        _emitterView = [[NOIEmitterView alloc]initWithFrame:CGRectMake(0,
                                                                      0,
                                                                      rect.size.width,
                                                                      rect.size.height)];
        
        [self addSubview:self.emitterView];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.fingerSquare.superlayer == nil) {
        [self.layer addSublayer:_fingerSquare];
    }
    
    self.fingerSquare.hidden = NO;
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    [self.emitterView setIsEmitting:YES];
    [self.emitterView updateEmitterAtPoint:touchPoint];
    
    [self playAtPoint: touchPoint];
    
    self.fingerSquare.position = touchPoint;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    [self.emitterView setIsEmitting:YES];
    [self.emitterView updateEmitterAtPoint:touchPoint];
    
    [self playAtPoint:touchPoint];
    
    self.fingerSquare.position = touchPoint;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.fingerSquare.hidden = YES;
    
    [NOIRemoteSynth stopPlaying];
    [self.emitterView setIsEmitting:NO];
    [self.emitterView updateEmitterAtPoint:CGPointZero];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.fingerSquare.hidden = YES;
    [NOIRemoteSynth stopPlaying];
    
    [self.emitterView setIsEmitting:NO];
    [self.emitterView updateEmitterAtPoint:[[touches anyObject] locationInView:self]];
}

- (void)playAtPoint:(CGPoint)point
{
    CGFloat pitch = MIN_FREQ + (MAX_FREQ - MIN_FREQ) * point.x / CGRectGetWidth(self.frame);
    CGFloat filter = MIN_FILT + (MAX_FILT - MIN_FILT) * point.y / CGRectGetHeight(self.frame);
    
    [NOIRemoteSynth playFrequency:pitch
                  filterFrequency:filter
                             wave:[self.delegate waveType]
                             gain:[self.delegate gain]
                        resonance:[self.delegate resonance]];
}

@end
