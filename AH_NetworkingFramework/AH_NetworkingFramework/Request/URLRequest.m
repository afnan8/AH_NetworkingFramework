//
//  URLRequest.m
//  Networking
//
//  Created by afnan on 11/30/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "URLRequest.h"

@implementation URLRequest

- (NSMutableDictionary*) backgroundTaskAndCallBacks {
    static NSMutableDictionary* dataTasksArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        dataTasksArray = [[NSMutableDictionary alloc] init];
    });
    return dataTasksArray;
}

//singletone class object
+ (instancetype)sharedInstance {
    static URLRequest *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[URLRequest alloc] init];
    });
    return sharedInstance;
}

- (instancetype) initWithURL: (NSString *)URLString
                                httpMethod: (HTTPMethod)method
                                bodyParameters: (NSDictionary <NSString *, NSString *> *)parameters
                                headers:(NSMutableDictionary<NSString *,NSString *> *)headers
                                completionHandler: (ComplitionHandler) completionHandler  {
    
    _URLString = URLString;
    _method = method;
    _parameters = parameters;
    _headers = headers;
    _completionHandler = completionHandler;
    self = [super initWithCompletion: completionHandler];
    
    if (self) {
        self.isRequestRunInBackground = false;
    }
    return self;
}

- (void) main {
    
    URLRequest *request = [[URLRequest alloc] init];
    
    NSURLRequest *urlRequest = [request handleRequestStructureForURl: _URLString httpMethod: _method bodyParameters: _parameters headers: _headers];
    
    SessionManager *manager = [[SessionManager alloc] init];
    
    if ([AsyncOperation sharedInstance].isRequestRunInBackground) {
        /**
         handle request with backgroun session
         */
        [manager dataTaskWithRequestInBackground: urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            _completionHandler(data, response,error);
            [self finish];
        }];
    } else {
        /**
         handle request with default session
         */
        [manager dataTaskWithRequest: urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            _completionHandler(data, response,error);
            [self finish];
            
        }];
    }
    [super main];
}
    

/**
 method return Http request to handleRequestForURL method after configration
 */
- (NSURLRequest *)handleRequestStructureForURl: (NSString *)URLString
                                httpMethod: (HTTPMethod)method
                                bodyParameters: (NSDictionary <NSString *, NSString *> *)parameters
                                headers:(NSMutableDictionary<NSString *,NSString *> *)headers {
    
    NSError *error;
    
    NSURL *url = [NSURL URLWithString: URLString];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL: url];
   
    URLRequest *request = [[URLRequest alloc] init];

    if (parameters) {
        NSData *postData = [NSJSONSerialization dataWithJSONObject: parameters options:0 error:&error];
        [urlRequest setHTTPBody:postData];
    }
    
    if (!headers) {
        headers = [[NSMutableDictionary alloc] init];
    }
    
    [headers addEntriesFromDictionary: [request addRequestHeader: method]];
    
    for (NSString* key in headers) {
        NSString* value = headers[key];
        [urlRequest addValue:value forHTTPHeaderField: key];
    }
    
    [urlRequest setHTTPMethod: [HTTPMethods getMethod: method]];
    return urlRequest;
}
    
/**
 add default header as adictionary to request according to http method
*/
- (NSDictionary<NSString *,NSString *> *)addRequestHeader: (HTTPMethod)method {
    switch (method) {
        case HTTPMethodPost:
        return @{@"Content-Type": @"application/json", @"Accept": @"application/json"};
        
        case HTTPMethodGet:
        return NULL;
        
        case HTTPMethodPut:
        return @{@"Content-Type": @"application/json", @"Accept": @"application/json"};
        
        case HTTPMethodDelete:
        return NULL;
        
        default:
        break;
    }
}

/**
 NSURLSessionDelegate the methods.
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    NSLog(@"Background task complete with error: %@", error);
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    if (data) {
        
        for (NSURLSessionDataTask *task in self.backgroundTaskAndCallBacks) {
            
            if (task == dataTask) {
                ComplitionHandler handler = self.backgroundTaskAndCallBacks[task];
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    handler(data, [dataTask response], nil);
                    [[AsyncOperation sharedInstance] finish];
                    [self.backgroundTaskAndCallBacks removeObjectForKey:task];
                });
            } else {
                [dataTask resume];
            }
            continue;
        }
        
    }
}
@end
