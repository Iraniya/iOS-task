//
//  tempTests.m
//  tempTests
//
//  Created by agile on 01/01/01.
//  Copyright (c) 2001 Agile. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface tempTests : XCTestCase

@end

@implementation tempTests

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
