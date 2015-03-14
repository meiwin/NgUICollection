//
//  NgUICollection.h
//  NgUICollection
//
//  Created by Meiwin Fu on 25/11/14.
//  Copyright (c) 2014 meiwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NgUICollection : NSObject
{
  NSMutableArray * _sectionArray;
  NSMutableArray * _dataArray;
}

// Check for emptiness
- (BOOL) isEmpty;

// Accessing data
- (NSUInteger) numberOfSections;
- (NSUInteger) numberOfItemsInSection:(NSUInteger)section;
- (NSUInteger) numberOfItems;
- (id) objectForSectionAtIndex:(NSUInteger)section;
- (id) objectForItemAtIndexPath:(NSIndexPath *)ip;
- (NSIndexPath *) indexPathForItemObject:(id)object;
- (NSUInteger) indexForSectionObject:(id)sectionObject;
- (NSArray *)allSectionObjects;
- (NSArray *)allItemObjectsInSection:(NSUInteger)section;

// Inserting data
- (NSUInteger)addSection:(id)sectionObject;
- (NSUInteger)insertSection:(id)sectionObject atIndex:(NSUInteger)sectionIndex;
- (NSIndexPath *)addItem:(id)object inSection:(NSUInteger)sectionIndex;
- (NSIndexPath *)insertItem:(id)object atIndexPath:(NSIndexPath *)indexPath;

// Deleting data
- (NSIndexPath *)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSUInteger)removeSectionAtIndex:(NSUInteger)sectionIndex;

// Moving data
- (void)moveSectionFrom:(NSUInteger)from to:(NSUInteger)to;
- (void)moveItemFrom:(NSIndexPath *)from to:(NSIndexPath *)to;

// Enumerate
- (void)enumerateItems:(void(^)(NSUInteger, NSUInteger, id, BOOL*))block;
- (void)enumerateSections:(void(^)(NSUInteger, id, BOOL *))block;
- (void)addFromArray:(NSArray *)array;
- (void)addFromArray:(NSArray *)array inSection:(NSUInteger)sectionIndex;
@end