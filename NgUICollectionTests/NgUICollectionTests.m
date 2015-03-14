//
//  NgUICollectionTests.m
//  NgUICollection
//
//  Created by Meiwin Fu on 14/3/15.
//  Copyright (c) 2015 Meiwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NgUICollection.h"

@interface NgUICollectionTests : XCTestCase

@end

@implementation NgUICollectionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyCollection
{
  NgUICollection * c = [[NgUICollection alloc] init];
  XCTAssertEqual(YES, [c isEmpty]);
  XCTAssertEqual(0, [c numberOfSections]);
  XCTAssertEqual(0, [c numberOfItems]);
  XCTAssertEqual(0, [c numberOfItemsInSection:1]);
}
- (void)testCRUD
{
  NgUICollection * c = [[NgUICollection alloc] init];

  [c addSection:@0];
  [c addSection:@1];
  [c addItem:@0 inSection:0];
  [c addItem:@1 inSection:0];
  [c addItem:@0 inSection:1];
  [c addItem:@1 inSection:1];
  [c addItem:@2 inSection:1];
  
  XCTAssertEqual(NO, [c isEmpty]);
  XCTAssertEqual(2, [c numberOfSections]);
  XCTAssertEqual(2, [c numberOfItemsInSection:0]);
  XCTAssertEqual(3, [c numberOfItemsInSection:1]);
  XCTAssertEqual(@0, [c objectForSectionAtIndex:0]);
  XCTAssertEqual(@1, [c objectForSectionAtIndex:1]);
  XCTAssertEqual(@0, [c objectForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
  XCTAssertEqual(@1, [c objectForItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]);
  XCTAssertEqualObjects([NSIndexPath indexPathForRow:0 inSection:0], [c indexPathForItemObject:@0]);
  XCTAssertEqualObjects([NSIndexPath indexPathForRow:2 inSection:1], [c indexPathForItemObject:@2]);
  XCTAssertEqual(0, [c indexForSectionObject:@0]);
  
  XCTAssertEqualObjects((@[ @0, @1 ]), [c allSectionObjects]);
  XCTAssertEqualObjects((@[ @0, @1 ]), [c allItemObjectsInSection:0]);
  XCTAssertEqualObjects((@[ @0, @1, @2 ]), [c allItemObjectsInSection:1]);
  
  [c insertItem:@5 atIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
  XCTAssertEqualObjects(@5, [c objectForItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]);
  
  [c insertSection:@3 atIndex:1];
  XCTAssertEqual(3, [c numberOfSections]);
  XCTAssertEqual(0, [c numberOfItemsInSection:1]);
  
  [c removeItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:2]];
  XCTAssertEqual(2, [c numberOfItemsInSection:2]);
  
  [c removeSectionAtIndex:2];
  XCTAssertEqual(2, [c numberOfSections]);
  
  [c moveSectionFrom:1 to:0];
  XCTAssertEqual(0, [c numberOfItemsInSection:0]);
  XCTAssertEqual(3, [c numberOfItemsInSection:1]);
  
  [c moveItemFrom:[NSIndexPath indexPathForRow:1 inSection:1]
              to:[NSIndexPath indexPathForRow:0 inSection:1]];
  XCTAssertEqualObjects((@[ @5, @0, @1]), [c allItemObjectsInSection:1]);
  
  [c addFromArray:@[ @1, @2, @3 ]];
  XCTAssertEqualObjects((@[ @1, @2, @3 ]), [c allItemObjectsInSection:0]);
}
@end
