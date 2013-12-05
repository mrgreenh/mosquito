//
//  NOIUserViewController.m
//  BUH
//
//  Created by John Forester on 10/19/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOIUserViewController.h"
#import "NOINetworkingManager.h"

@interface NOIUserViewController ()

@end

@implementation NOIUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:kUserParam];
    
    [self performSegueWithIdentifier:@"userSegue" sender:self];
    
    return YES;
}



@end
