//
//  SDCellControllerDelegate.h
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SDBaseCollectionViewCell;
@class SDBaseCellController;

@protocol SDCellControllerDelegate <NSObject>
@optional
- (void)cellController:(SDBaseCellController *)cellController didSelectBoardCollectionViewCell:(SDBaseCollectionViewCell *)cell model:(NSObject *)model;
@end
