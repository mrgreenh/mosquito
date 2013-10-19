//
//  NOIViewController.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOIViewController.h"
#import "NOITouchView.h"
#import "TheAmazingAudioEngine.h"

@interface NOIViewController ()

@property (weak, nonatomic) IBOutlet NOITouchView *touchView;
@property (nonatomic, strong) AEAudioUnitChannel *sampler;

@end

@implementation NOIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

@end
