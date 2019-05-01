//
//  AF_NetworkingTest.m
//  AH_NetworkingFrameworkTests
//
//  Created by afnan on 12/4/18.
//  Copyright © 2018 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AH_Networking.h"

@interface AF_NetworkingTest : XCTestCase

@property AH_Networking *ah_Networking;

@end

@implementation AF_NetworkingTest

- (void)setUp {
    [super setUp];
    _ah_Networking = [[AH_Networking alloc] init];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsRequestRunInBackgroundNotNil {
    
    XCTAssertFalse(_ah_Networking.isRequestRunInBackground);

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
