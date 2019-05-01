//
//  HTTPMethods.m
//  Networking
//
//  Created by afnan on 12/2/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "HTTPMethods.h"

@implementation HTTPMethods

    + (NSString *) getMethod: (HTTPMethod) method {
        
        switch (method) {
            
            case HTTPMethodGet:
            return @"GET";
            break;
            
            case HTTPMethodPost:
            return @"POST";
            break;
            
            case HTTPMethodPut:
            return @"PUT";
            break;
            
            case HTTPMethodDelete:
            return @"DELETE";
            break;
            
            default:
            break;
        }
    }
@end
