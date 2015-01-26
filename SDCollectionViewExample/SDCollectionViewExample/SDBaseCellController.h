//
//  SDCellController.h
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDCellControllerDelegate.h"
#import "SDModel.h"
#import <UIKit/UIKit.h>

@interface SDBaseCellController : NSObject
{
@protected
    __weak UICollectionViewCell *_collectionViewCell;
}
@property (weak, nonatomic) id<SDCellControllerDelegate> delegate;
@property (weak, nonatomic) SDBaseCollectionViewCell *cell;
@property (strong, nonatomic) SDModel *model;

@property (strong, nonatomic) UITapGestureRecognizer* singleTapRecognizer;

+ (NSString *)cellReuseIdentifier;
- (void)configureCell:(SDBaseCollectionViewCell *)cell withModel:(NSObject *)model;
- (void)loadImageWithUrlString:(NSString *)imageUrlString;
- (void)didSingleTapCell:(UITapGestureRecognizer *)recognizer;

@end
