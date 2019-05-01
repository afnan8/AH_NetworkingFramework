////
////  ParameterEncoding.m
////  Networking
////
////  Created by afnan on 11/30/18.
////  Copyright © 2018 macbook pro. All rights reserved.
////
//
//#import "ParameterEncoding.h"
//
//@implementation ParameterEncoding
//    
//- (NSString *) getDataFrom:(NSString *)url withBody:(NSString *)bodyParameters {
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod: @"POST"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:[bodyParameters dataUsingEncoding:NSUTF8StringEncoding]];
////    [request setHTTPBody:body];
////    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[body length]] forHTTPHeaderField:@"Content-Length"];
//    [request setURL:[NSURL URLWithString:url]];
//    
//    NSError *error = nil;
//    NSHTTPURLResponse *responseCode = nil;
//    
//    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
//    
//    if([responseCode statusCode] != 200){
//        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
//        return nil;
//    }
//    
//    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
//    
//}
//@end

