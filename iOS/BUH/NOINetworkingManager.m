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

    }
    
    return  self;
}

- (void)playWithParams:(NSDictionary *)params
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://10.22.12.76:5000/play/"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"RESPONSE: %@", [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding]);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

- (void)logInAsUser:(NSString *)userName
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user" : userName,};
    
    [manager POST:@"http://10.22.12.76:5000/"
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [[NSUserDefaults standardUserDefaults] setObject:userName forKey:kUserParam];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

@end
