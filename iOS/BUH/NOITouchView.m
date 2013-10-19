//
//  NOITouchView.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOITouchView.h"
#import "NOINetworkingManager.h"

#define MIN_FREQ 440
#define MAX_FREQ 2000

@interface NOITouchView ()

@property (nonatomic, strong) CAShapeLayer *fingerCircle;

@end

@implementation NOITouchView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _fingerCircle = [CAShapeLayer layer];
        _fingerCircle.frame = CGRectMake(0, 0, 50, 50);
        _fingerCircle.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.7].CGColor;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.fingerCircle.superlayer == nil) {
        [self.layer addSublayer:_fingerCircle];
    }
    
    self.fingerCircle.hidden = NO;
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    [self playAtPoint: touchPoint];
    
    self.fingerCircle.position = touchPoint;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    [self playAtPoint:touchPoint];
    
    self.fingerCircle.position = touchPoint;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.fingerCircle.hidden = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.fingerCircle.hidden = YES;
    
    [[NOINetworkingManager sharedInstance] playTone:@(-1)];
}

- (void)playAtPoint:(CGPoint)point
{
    int pitch = MIN_FREQ + (MAX_FREQ - MIN_FREQ) * point.x / CGRectGetWidth(self.frame);
    
    [[NOINetworkingManager sharedInstance] playTone:@(pitch)];
}

@end
