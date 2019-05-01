//
//  AH_Networking.m
//  Networking
//
//  Created by afnan on 12/4/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "AH_Networking.h"


@implementation AH_Networking
    
//singletone class object
+ (instancetype)sharedInstance {
    static AH_Networking *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[AH_Networking alloc] init];
    });
    return sharedInstance;
}
    
- (instancetype)init {
    self = [super init];
    if (self) {
        [AsyncOperation sharedInstance].operationQueue = [[NSOperationQueue alloc] init];

        [[AsyncOperation sharedInstance].operationQueue setMaxConcurrentOperationCount: [[AsyncOperation sharedInstance] maxConcurrentRequests]];
        
        self.isRequestRunInBackground = false;
    }
    return self;
}

- (void)request:(NSString *)URLString
                httpMethod: (HTTPMethod)method
                bodyParameters: (NSDictionary <NSString *, NSString *> *)parameters
                headers:(NSMutableDictionary<NSString *,NSString *> *)headers
                complitionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))complitionHandler {
    
    NSError * error = [NSError errorWithDomain: @"" code: 0 userInfo:@{NSLocalizedDescriptionKey: @"No Internet access" }];

    if ([[AsyncOperation sharedInstance] maxConcurrentRequests] == 0) {
        NSLog(@"Error: %@", error.localizedDescription);
        complitionHandler(nil, nil, error);
    } else {
        [AsyncOperation sharedInstance].isRequestRunInBackground = [AH_Networking sharedInstance].isRequestRunInBackground;
        [[AsyncOperation sharedInstance].operationQueue addOperation: [[URLRequest alloc] initWithURL: URLString httpMethod: method bodyParameters: parameters headers: headers completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            complitionHandler(data, response, error);
        }]];
    }
}
@end
