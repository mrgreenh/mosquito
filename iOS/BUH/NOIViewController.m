//
//  NOIViewController.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOIViewController.h"

@interface NOIViewController ()

@property (weak, nonatomic) IBOutlet NOITouchView *touchView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISlider *resSlider;

@end

@implementation NOIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.touchView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma NOITouchViewDelegate

- (NOIWaveType)waveType
{
    return [self.segmentedControl selectedSegmentIndex];
}

- (IBAction)sliderChanged:(id)sender
{
    
}

- (CGFloat)gain
{
    return self.slider.value;
}

- (CGFloat)resonance
{
    return self.resSlider.value;
}

@end
