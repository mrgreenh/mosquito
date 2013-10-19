//
//  NOINetworkingManager.m
//  BUH
//
//  Created by John Forester on 10/18/13.
//  Copyright (c) 2013 John Forester. All rights reserved.
//

#import "NOINetworkingManager.h"
#import "AFHTTPRequestOperationManager.h"

@interface NOINetworkingManager ()

@property (nonatomic, strong) NSOperationQueue *pitchQueue;

@end

@implementation NOINetworkingManager

+ (NOINetworkingManager *)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) , ^{
            _pitchQueue = [[NSOperationQueue alloc] init];
        });
    }
    
    return  self;
}

- (void)playTone:(NSNumber *)pitch
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [self.pitchQueue addOperationWithBlock:^{
        [manager GET:[NSString stringWithFormat:@"http://10.22.12.76:5000/note/%d",[pitch integerValue]]
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 NSLog(@"JSON: %@", responseObject);
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
             }];
    }];
}

- (void)playPitch:(NSNumber *)pitch filterCutoff:(NSNumber *)filterCutoff
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"note"    : pitch,
                                 @"filter"  : filterCutoff};
    
    [manager POST:@"http://example.com/resources.json"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

@end
