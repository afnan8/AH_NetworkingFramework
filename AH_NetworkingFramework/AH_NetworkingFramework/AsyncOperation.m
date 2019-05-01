//
//  AsyncOperation.m
//  Networking
//
//  Created by afnan on 12/3/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "AsyncOperation.h"

@implementation AsyncOperation

@synthesize ready = _ready;
@synthesize executing = _executing;
@synthesize finished = _finished;

//singletone class object
+ (instancetype)sharedInstance {
    static AsyncOperation *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[AsyncOperation alloc] init];
    });
    return sharedInstance;
}

- (instancetype)initWithCompletion: (void (^)(NSData *data, NSURLResponse *response, NSError *error))completion {
    self = [super init];
    
    if (self) {
        self.ready = YES;
    }
    return self;
}

- (void)setReady:(BOOL)ready {
    if (_ready != ready) {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isReady))];
        _ready = ready;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isReady))];
    }
}
- (BOOL)isReady {
    return _ready;
}

- (void)setExecuting:(BOOL)executing {
    if (_executing != executing) {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
        _executing = executing;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    }
}
    
- (BOOL)isExecuting {
    return _executing;
}
    
- (void)setFinished:(BOOL)finished {
    if (_finished != finished) {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
        _finished = finished;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    }
}
    
- (BOOL)isFinished {
    return _finished;
}
    
- (BOOL)isAsynchronous {
    return YES;
}
    
- (void)start {
    if (!self.isExecuting) {
        self.ready = NO;
        self.executing = YES;
        self.finished = NO;
        NSLog(@"\"%@\" Operation Started.", self.name);
    }
    [self main];
}
    
- (void)finish {
    if (self.executing) {
        NSLog(@"\"%@\" Operation Finished.", self.name);
        self.executing = NO;
        self.finished = YES;
    }
}
    
- (void)cancel {
    [self finish];
}

- (int) maxConcurrentRequests {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    switch (networkStatus) {
        case NotReachable:
            return 0;
        case ReachableViaWiFi:
            return 1;
        case ReachableViaWWAN:
            return 2;
    }
}
@end
