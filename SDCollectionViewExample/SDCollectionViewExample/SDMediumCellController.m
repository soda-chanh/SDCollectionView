//
//  SDMediumCellController.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDMediumCellController.h"

@interface SDMediumCellController() <UIGestureRecognizerDelegate>

@end


@implementation SDMediumCellController

+ (NSString *)cellReuseIdentifier
{
    return @"SDMediumCollectionViewCell";
}


#pragma mark - Private


- (void)configureCell:(SDBaseCollectionViewCell *)cell withModel:(NSObject *)model
{
    self.cell = cell;
    [self loadImageWithUrlString:self.model.imageUrl];
}

@end