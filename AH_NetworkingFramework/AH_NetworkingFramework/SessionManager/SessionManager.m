//
//  SessionManager.m
//  Networking
//
//  Created by afnan on 11/30/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "SessionManager.h"
#import "URLRequest.h"

@implementation SessionManager

//singletone class object
+ (instancetype)sharedInstance {
    static SessionManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[SessionManager alloc] init];
    });
    return sharedInstance;
}

/**
 create the URLSession with default configuration
 */
+ (NSURLSession *)sharedSession {
    
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [NSURLSession sharedSession];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.allowsCellularAccess = YES;
        configuration.timeoutIntervalForRequest = 30.0;
        session = [NSURLSession sessionWithConfiguration: configuration];
    });
    return session;
}


/**
 Create the URLSession with background configuration
*/
+ (NSURLSession *)backgroundSession {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *identifier = @"BackgroundSession";
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: identifier];
        configuration.allowsCellularAccess = YES;
        configuration.timeoutIntervalForRequest = 30.0;
        [configuration setSessionSendsLaunchEvents: YES];
        [configuration setDiscretionary: YES];
        session = [NSURLSession sessionWithConfiguration: configuration delegate: [URLRequest sharedInstance] delegateQueue:[NSOperationQueue mainQueue]];
    });
    return session;
}

- (void)dataTaskWithRequest: (NSURLRequest *)request completionHandler: (void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    //Background Thread
    [SessionManager sharedInstance].dataTask = [[SessionManager sharedSession] dataTaskWithRequest: request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            completionHandler(data, response, error);
        });
        
    }];
    
    [[SessionManager sharedInstance].dataTask resume];

}
    

- (void)dataTaskWithRequestInBackground: (NSURLRequest *)request completionHandler: (ComplitionHandler) completionHandler {
    
    NSURLSession *session = [SessionManager backgroundSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest: request];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        //Run UI Updates
    });
    
    [[[URLRequest sharedInstance] backgroundTaskAndCallBacks] setObject: completionHandler forKey: dataTask];
    [dataTask resume];
}
@end
