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
//        SessionManager *manager = [[SessionManager alloc] init];
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
//    [SessionManager sharedInstance].dataTask  = [session dataTaskWithRequest: request];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest: request];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        //Run UI Updates
    });
    
//    [SessionManager sharedInstance].completionHandler = completionHandler;
    [[[URLRequest sharedInstance] backgroundTaskAndCallBacks] setObject: completionHandler forKey: dataTask];
    NSLog(@"%lu",(unsigned long)[[URLRequest sharedInstance] backgroundTaskAndCallBacks].count);
    
    [dataTask resume];
}
@end

//- (void)dataTaskWithRequest: (NSURLRequest *)request success: (void(^)(NSHTTPURLResponse *response, NSData *data))success failure:(void (^)(NSError * error))failure {
//
//    dispatch_async(dispatch_get_main_queue(), ^(void) {
//
//    });
//
//    NSURLSessionDataTask *dataTask = [[SessionManager sharedSession] dataTaskWithRequest: request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
//
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//
//        if(!error) {
//            success(httpResponse, data);
//
//        } else {
//            failure(error);
//        }
//    }];
//    [dataTask resume];
//
//}
//    if (data) {
//        if (self.dataTasksArray.count > 0) {
//            [self.dataTasksArray removeObjectAtIndex: 0];
//        }
//
//        if (self.dataTasksArray.count > 0) {
//            [self.dataTasksArray[0] resume];
//        }
//
//        NSError *parseError = nil;
//        id responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//        NSLog(@"The response is from session- %@",responseDictionary);
//    }


//
//- (NSURLSessionConfiguration *) setupSessionConfigrationAccordingToNetworkCondition: (NSURLSessionConfiguration *) configuration {
//
//
////    configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
//    configuration.allowsCellularAccess = YES;
//    configuration.timeoutIntervalForRequest = 60.0;
//
//    [Connection connectionType: ^(NetworkStatus networkStatus) {
//        switch (networkStatus) {
//            case ReachableViaWiFi:
//            NSLog(@"from session manager wifi");
//
////            [configuration setHTTPMaximumConnectionsPerHost: 6];
//            break;
//
//            case ReachableViaWWAN:
////            [configuration setHTTPMaximumConnectionsPerHost: 2];
//                        NSLog(@"from session manager cellular");
//            break;
//
//            default:
//                        NSLog(@"from session manager none");
//            break;
//        }
//    }];
//
//    return configuration;
//}
//- (void)dataTaskWithRequestInBackground: (NSURLRequest *)request success: (void(^)(NSHTTPURLResponse *  response, NSData *data))success failure:(void (^)(NSError * error))failure {
//
//    NSURLSession *session = [SessionManager backgroundSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest: request];
//
//    [dataTask resume];
////    dispatch_async(dispatch_get_main_queue(), ^{
////        handler(data, response, error);
////    });
////
////    [self.dataTasksArray addObject: dataTask];
////    [self.dataTasksArray[0] resume];
////    static dispatch_once_t onceToken;
////    dispatch_once(&onceToken, ^{
////        [self.dataTasksArray[0] resume];
////    });
//}

    
    
    //NSURLSession Delegate

    //
    //    - (void)callCompletionHandlerForSession:(NSString *)identifier {
    //        CompletionHandlerType handler = [self.completionHandlerDictionary objectForKey: identifier];
    //        if (handler) {
    //            [self.completionHandlerDictionary removeObjectForKey: identifier];
    //            NSLog(@"Calling completion handler for session %@", identifier);
    //            handler();
    //        }
    //    }
    //    - (void)URLSession:(NSURLSession *)session
    //                  task:(NSURLSessionTask *)task
    //  didCompleteWithError:(NSError *)error{
    //        NSLog(@"download didCompleteWithError:%@",error);
    //    }
    
    
//#pragma mark - NSURLSessionDownloadTaskDelegate
    //    - (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    //
    //            NSLog(@"download didFinishDownloadingToURL");
    //        }

    
    //    - (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    //
    //    }
    


    
//        dispatch_async(dispatch_get_main_queue(), ^{ // Correct
//
//        });
//
// completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            if(httpResponse.statusCode == 200) {
//                success(data, httpResponse);
//            } else {
//                failure(error);
//            }
//        }];


    
//    @end


