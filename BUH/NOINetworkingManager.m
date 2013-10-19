//
//  NOINetworkingManager.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOINetworkingManager.h"
#import "AFHTTPRequestOperationManager.h"

@implementation NOINetworkingManager

+ (void)playTone:(NSNumber *)pitch
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
    [manager GET:[NSString stringWithFormat:@"http://10.22.12.76:5000/note/%d",[pitch integerValue]]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
