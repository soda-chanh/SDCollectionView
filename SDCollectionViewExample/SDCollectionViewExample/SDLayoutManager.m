//
//  SDLayoutManager.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/24/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDLayoutManager.h"
#import "SDLayoutItem.h"
#import "SDBaseCellController.h"
#import "SDSmallCellController.h"
#import "SDStackCellController.h"
#import "SDMediumCellController.h"
#import "SDLargeCellController.h"

typedef NS_ENUM(NSInteger, SDLayoutPageType) {
    SDLayoutPageTypeA,
    SDLayoutPageTypeB,
    SDLayoutPageTypeC,
    SDLayoutPageTypeD
};

typedef NS_ENUM(NSInteger, SDLayoutItemType) {
    SDLayoutItemTypeSmallCell,
    SDLayoutItemTypeMediumCell,
    SDLayoutItemTypeLargeCell,
    SDLayoutItemTypeStackedCells
};

@implementation SDLayoutManager


static SDLayoutManager *_sharedInstance = nil;

#pragma mark - Class

+ (SDLayoutManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super alloc] init];
    });
    
    return _sharedInstance;
}


+ (NSArray *)exampleLayoutItems
{
    return [self layoutItemsForPattern:[self mainLayoutPattern]];
}


+ (NSArray *)mainLayoutPattern
{
    return @[[NSNumber numberWithInteger:SDLayoutPageTypeA],
             [NSNumber numberWithInteger:SDLayoutPageTypeC],
             [NSNumber numberWithInteger:SDLayoutPageTypeD]
             /*
             [NSNumber numberWithInteger:SDLayoutPageTypeA],
             [NSNumber numberWithInteger:SDLayoutPageTypeC],
             [NSNumber numberWithInteger:SDLayoutPageTypeD],
             [NSNumber numberWithInteger:SDLayoutPageTypeA],
             [NSNumber numberWithInteger:SDLayoutPageTypeC],
             [NSNumber numberWithInteger:SDLayoutPageTypeD]*/];
}


+ (NSArray *)layoutItemsForPageType:(SDLayoutPageType)type
{
    switch (type) {
        case SDLayoutPageTypeA:
            return @[[self layoutItemForItemType:SDLayoutItemTypeMediumCell],
                     [self layoutItemForItemType:SDLayoutItemTypeSmallCell],
                     [self layoutItemForItemType:SDLayoutItemTypeSmallCell]];
            break;
            
        case SDLayoutPageTypeB:
            return @[[self layoutItemForItemType:SDLayoutItemTypeSmallCell],
                     [self layoutItemForItemType:SDLayoutItemTypeSmallCell],
                     [self layoutItemForItemType:SDLayoutItemTypeMediumCell]];
            break;
            
        case SDLayoutPageTypeC:
            return @[[self layoutItemForItemType:SDLayoutItemTypeLargeCell]];
            break;
            
        case SDLayoutPageTypeD:
            return @[[self layoutItemForItemType:SDLayoutItemTypeStackedCells],
                     [self layoutItemForItemType:SDLayoutItemTypeStackedCells],
                     [self layoutItemForItemType:SDLayoutItemTypeStackedCells],
                     [self layoutItemForItemType:SDLayoutItemTypeStackedCells]];
            break;
            
        default:
            return @[];
            break;
    }
}


+ (SDLayoutItem *)layoutItemForItemType:(SDLayoutItemType)type
{
    NSInteger navigationBarHeight = 64;
    CGSize size = [UIScreen mainScreen].bounds.size;
    size.height -= navigationBarHeight;
    switch (type) {
        case SDLayoutItemTypeSmallCell: {
            SDLayoutItem *item = [[SDLayoutItem alloc] initWithCellControllerClass:[SDSmallCellController class] nibName:[SDSmallCellController cellReuseIdentifier]];
            item.size = CGSizeMake(size.width/2, size.height/3);
            return item;
            break;
        }
        case SDLayoutItemTypeMediumCell: {
            SDLayoutItem *item = [[SDLayoutItem alloc] initWithCellControllerClass:[SDMediumCellController class] nibName:[SDMediumCellController cellReuseIdentifier]];
            item.size = CGSizeMake(size.width, size.height * 2/3);
            return item;
            break;
        }
            
        case SDLayoutItemTypeLargeCell: {
            SDLayoutItem *item = [[SDLayoutItem alloc] initWithCellControllerClass:[SDLargeCellController class] nibName:[SDLargeCellController cellReuseIdentifier]];
            item.size = CGSizeMake(size.width, size.height);
            return item;
            break;
        }
        case SDLayoutItemTypeStackedCells: {
            SDLayoutItem *item = [[SDLayoutItem alloc] initWithCellControllerClass:[SDStackCellController class] nibName:[SDStackCellController cellReuseIdentifier]];
            item.size = CGSizeMake(size.width, size.height / 4);
            return item;
            break;
        }

        default:
            return nil;
            break;
    }
}


+ (NSArray *)layoutItemsForPattern:(NSArray *)pattern
{
    NSMutableArray *items = [NSMutableArray array];
    for (NSNumber *layoutPageType in pattern) {
        [items addObjectsFromArray:[self layoutItemsForPageType:layoutPageType.integerValue]];
    }
    return items;
}

@end