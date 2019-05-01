//
//  UIImageViewetImagewithURLTests.m
//  NetworkingTests
//
//  Created by afnan on 12/4/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIImageView+Category.h"

@interface UIImageViewetImagewithURLTests : XCTestCase
@property UIImageView *imageView;
@end

@implementation UIImageViewetImagewithURLTests

- (void)setUp {
    [super setUp];
    _imageView = [[UIImageView alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIImageViewSetImagewithURL {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Request should succeed"];

    __block NSData *responseImage;

    [_imageView setImageWithURL: @"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg" completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", data);
        responseImage = data;
        [expectation fulfill];

    }];
    
    [self waitForExpectationsWithTimeout: 30 handler:^(NSError * _Nullable error) {
        
    }];

    XCTAssertNotNil(responseImage);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
