 //
//  UIImageView+Category.m
//  Networking
//
//  Created by afnan on 12/1/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import "UIImageView+Category.h"
#import "AH_Networking.h"

@implementation UIImageView (Category)

UIActivityIndicatorView *activityIndicator;
NSData * ah_image;
 
- (void) setImageWithURL: (NSString *)url completionHandler: (void(^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    [activityIndicator setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    [self addSubview: activityIndicator];
    [self layoutSubviews];
    [activityIndicator startAnimating];
    
    [[AH_Networking sharedInstance] request:url httpMethod: HTTPMethodGet bodyParameters:nil headers:nil complitionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        self.image = [UIImage imageWithData: data];
        [activityIndicator setHidesWhenStopped: YES];
        [activityIndicator stopAnimating];

        completionHandler(data, response, error);
    }];
}
    
-(void)layoutSubviews {
    [super layoutSubviews];
    activityIndicator.center = self.center;
}
@end
