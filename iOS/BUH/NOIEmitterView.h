//
//  NOIEmitterView.h
//  BUH
//
//  Created by John Forester on 10/19/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NOIEmitterView : UIView

- (void)updateEmitterAtPoint:(CGPoint)point;
- (void)setIsEmitting:(BOOL)isEmitting;

@end
