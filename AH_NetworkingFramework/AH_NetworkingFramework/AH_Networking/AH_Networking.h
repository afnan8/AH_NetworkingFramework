//
//  AH_Networking.h
//  Networking
//
//  Created by afnan on 12/4/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "HTTPMethods.h"
#import "URLRequest.h"

@interface AH_Networking : NSObject

@property (nonatomic) BOOL isRequestRunInBackground;

+ (instancetype)sharedInstance;

- (void) request:(NSString *)URLString
        httpMethod: (HTTPMethod)method
        bodyParameters: (NSDictionary <NSString *, NSString *> *)parameters
        headers:(NSMutableDictionary<NSString *,NSString *> *)headers
        complitionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))complitionHandler;
@end
