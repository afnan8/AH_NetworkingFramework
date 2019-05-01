//
//  HTTPMethods.h
//  Networking
//
//  Created by afnan on 12/2/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HTTPMethods: NSObject
    
    typedef NS_ENUM(NSInteger, HTTPMethod) {
        HTTPMethodPost,
        HTTPMethodGet,
        HTTPMethodPut,
        HTTPMethodDelete
    };
    
    + (NSString *) getMethod: (HTTPMethod)method;
@end
