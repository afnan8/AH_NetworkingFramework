//
//  main.m
//  Networking
//
//  Created by afnan on 11/29/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "URLRequest.h"

int main(int argc, char * argv[]) {

    @autoreleasepool {
                
//        [URLRequest handleRequestForURLTest: @"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Spirit_Rover-Mars_Night_Sky.jpg/211px-Spirit_Rover-Mars_Night_Sky.jpg" httpMethod: HTTPMethodGet bodyParameters: nil headers: nil success:^(NSHTTPURLResponse *response, NSData *data) {
//            
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            if(httpResponse.statusCode == 200) {}
//            NSError *parseError = nil;
////            id responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
////            NSLog(@"The response is - %ld",(long)httpResponse.statusCode);
//            //            }
//        } failure:^(NSError *error) {
//            NSLog(@"Error %@", error);
//        }];
//        
//        [URLRequest handleRequestForURLTest: @"http://bassthalk.com/api/v1/signin" httpMethod: HTTPMethodPost bodyParameters:@{@"email": @"a@a.com", @"password": @"123456"} headers: nil success:^(NSHTTPURLResponse *  response, NSData *data) {
//            
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            //            if(httpResponse.statusCode == 200) {
//            NSError *parseError = nil;
//            id responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//            NSLog(@"The response is - %@",responseDictionary);
////            //            }
//        } failure:^(NSError *error) {
//            NSLog(@"Error %@", error);
//        }];
//        
//      
////
//        [URLRequest handleRequestForURLTest: @"http://bassthalk.com/api/v1/spellingList?page=1&limit=10" httpMethod: HTTPMethodGet bodyParameters:nil headers: [@{@"Authorization":@"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjgzLCJpc3MiOiJodHRwOi8vYmFzc3RoYWxrLmNvbS9hcGkvdjEvc2lnbmluIiwiaWF0IjoxNTQzNTcyNTcyLCJleHAiOjE1NDQ3ODIxNzIsIm5iZiI6MTU0MzU3MjU3MiwianRpIjoiZ0xnaVNoQmxZeDdocGdEaiJ9.hstOtVoDl6pawHIuM_DjCYYNaF25Bc7ITOIa9DtsQMs"} mutableCopy] success:^(NSHTTPURLResponse *  response, NSData *data) {
//            
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            //            if(httpResponse.statusCode == 200) {
//            NSError *parseError = nil;
//            id responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//            NSLog(@"The response is - %@",responseDictionary);
//            //            }
//        } failure:^(NSError *error) {
//            NSLog(@"Error %@", error);
//        }];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

