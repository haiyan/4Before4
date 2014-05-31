//
//  _Before4Tests.m
//  4Before4Tests
//
//  Created by Haiyan Zhang on 30/05/2014.
//  Copyright (c) 2014 Haiyan Zhang. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _Before4Tests : XCTestCase

@end

@implementation _Before4Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
