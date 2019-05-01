//
//  URLRequest.h
//  Networking
//
//  Created by afnan on 11/30/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPMethods.h"
#import "SessionManager.h"
#import "AsyncOperation.h"

@interface URLRequest :AsyncOperation

typedef void (^ComplitionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@property (nonatomic, strong) NSString *URLString;
@property (nonatomic) HTTPMethod method;
@property (nonatomic, strong) NSDictionary <NSString *, NSString *> * parameters;
@property (nonatomic, strong) NSMutableDictionary<NSString *,NSString *> *headers;
@property ComplitionHandler completionHandler;

+ (instancetype)sharedInstance;

- (NSMutableDictionary*) backgroundTaskAndCallBacks;

- (instancetype) initWithURL: (NSString *)URLString
                                httpMethod: (HTTPMethod)method
                                bodyParameters:(NSDictionary <NSString *,  NSString *> *)parameters
                                headers:(NSMutableDictionary<NSString *,NSString *> *)headers
                                completionHandler: (ComplitionHandler) completionHandler;

- (NSURLRequest *)handleRequestStructureForURl: (NSString *)URLString
                                    httpMethod: (HTTPMethod)method
                                    bodyParameters: (NSDictionary <NSString *, NSString *> *)parameters
                                    headers:(NSMutableDictionary<NSString *,NSString *> *)headers;
@end

@interface URLRequest() <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@end

