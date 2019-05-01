//
//  HTTPMethodTest.m
//  NetworkingTests
//
//  Created by afnan on 12/3/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPMethods.h"

@interface HTTPMethodTest : XCTestCase
//@property HTTPMethods *httpMehod;
@end

@implementation HTTPMethodTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetHTTPMehods {
    NSString *expectedMethod = [HTTPMethods getMethod: HTTPMethodPost];
    NSString *testMethod = @"POST"; 
    XCTAssertEqualObjects(expectedMethod, testMethod);
    
    expectedMethod = [HTTPMethods getMethod: HTTPMethodGet];
    testMethod = @"GET";
    XCTAssertEqualObjects(expectedMethod, testMethod);
    
    expectedMethod = [HTTPMethods getMethod: HTTPMethodPut];
    testMethod = @"PUT";
    XCTAssertEqualObjects(expectedMethod, testMethod);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
