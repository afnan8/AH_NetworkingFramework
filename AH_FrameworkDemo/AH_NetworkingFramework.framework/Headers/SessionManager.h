//
//  SessionManager.h
//  Networking
//
//  Created by afnan on 11/30/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "AsyncOperation.h"

@interface SessionManager: NSObject

typedef void (^ComplitionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@property (readwrite, nonatomic, copy) ComplitionHandler completionHandler;
@property (nonatomic, strong) NSData *responseData;
@property (nonatomic) NSURLResponse *URLresponse;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

- (void)dataTaskWithRequestInBackground: (NSURLRequest *)request completionHandler: (ComplitionHandler) completionHandler;
- (void)dataTaskWithRequest: (NSURLRequest *)request completionHandler: (void (^)(NSData *data, NSURLResponse *response, NSError *error)) handler;

@end
