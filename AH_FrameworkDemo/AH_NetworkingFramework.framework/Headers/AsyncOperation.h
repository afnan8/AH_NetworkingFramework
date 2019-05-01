//
//  AsyncOperation.h
//  Networking
//
//  Created by afnan on 12/3/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface AsyncOperation : NSOperation

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic) BOOL isRequestRunInBackground;

+ (instancetype)sharedInstance ;
- (instancetype)initWithCompletion: (void (^)(NSData *data, NSURLResponse *response, NSError *error))completion;
- (void)finish;
- (int) maxConcurrentRequests;

@end
