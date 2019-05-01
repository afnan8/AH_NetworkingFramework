//
//  UIImageView+Category.h
//  Networking
//
//  Created by afnan on 12/1/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

- (void) setImageWithURL: (NSString *)url completionHandler: (void(^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
