//
//  NOIEmitterView.m
//  BUH
//
//  Created by John Forester on 10/19/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOIEmitterView.h"

#import <QuartzCore/QuartzCore.h>

@interface NOIEmitterView ()

@property (nonatomic, retain) CAEmitterLayer *emiterLayer;

@end

@implementation NOIEmitterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //emitter
        if (self.emiterLayer == nil) {
            self.emiterLayer = [[CAEmitterLayer alloc]init];
        }
        
        self.emiterLayer.position = CGPointZero;
        self.emiterLayer.emitterPosition = CGPointMake(0,0);
        self.emiterLayer.emitterSize = CGSizeMake(50, 50);
        self.emiterLayer.emitterCells = @[[self newEmitterCell]];
        self.emiterLayer.renderMode = kCAEmitterLayerAdditive;
        [self setIsEmitting:NO];
        
        [self.layer addSublayer:self.emiterLayer];
    }
    return self;
}

+ (Class) layerClass
{
    return [CAEmitterLayer class];
}

- (void)updateEmitterAtPoint:(CGPoint)point
{
    [self.emiterLayer setValue:[NSValue valueWithCGPoint:point]
                    forKeyPath:@"emitterPosition"];
    
    UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    
    [self.emiterLayer setValue:(id)color.CGColor
                    forKeyPath:@"emitterCells.cell.color"];
}

- (void)setIsEmitting:(BOOL)isEmitting
{
    [self.emiterLayer setValue:[NSNumber numberWithInt:isEmitting? 100:0]
                    forKeyPath:@"emitterCells.cell.birthRate"];
}

- (CAEmitterCell *)newEmitterCell
{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    cell.birthRate = 100;
    cell.lifetime = 1.0;
    cell.lifetimeRange = 0.5;
    cell.color = [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6]
                  CGColor];
    cell.blueRange = 0.0;
    
    cell.velocity = 20;
    cell.velocityRange = 30;
    cell.emissionRange = M_PI_2;
    cell.scaleSpeed = 0.5;
    cell.spin = 0.8;
    
    cell.contents = (id)[[UIImage imageNamed:@"particle.png"] CGImage];
    [cell setName:@"cell"];
    
    return cell;
}
@end
