//
//  URLRequestTests.m
//  NetworkingTests
//
//  Created by afnan on 12/3/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "URLRequest.h"

@interface URLRequestTests : XCTestCase
@property URLRequest *urlRequestToTest;

@end

@implementation URLRequestTests

- (void)setUp {
    [super setUp];
    _urlRequestToTest = [[URLRequest alloc] init];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testhandleRequestStructureForURl {
    
    NSURLRequest * request = [_urlRequestToTest handleRequestStructureForURl: @"http://test.com" httpMethod: HTTPMethodGet bodyParameters: @{@"key":@"value"} headers:nil];
    
    XCTAssertNotNil(request, @"Expected non-nil request.");
}

- (void) testhandleRequestStructureForURlNotNull {
    
    NSURLRequest * request =[_urlRequestToTest handleRequestStructureForURl: @"http://test.com" httpMethod:HTTPMethodGet bodyParameters:nil headers:nil];
    XCTAssertNotNil(request, @"Expected non-nil request.");

}
    
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
