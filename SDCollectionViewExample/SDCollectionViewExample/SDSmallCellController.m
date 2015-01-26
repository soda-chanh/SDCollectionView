//
//  SDSmallCellController.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDSmallCellController.h"

@implementation SDSmallCellController

+ (NSString *)cellReuseIdentifier
{
    return @"SDSmallCollectionViewCell";
}

- (void)configureCell:(SDBaseCollectionViewCell *)cell withModel:(NSObject *)model
{
    self.cell = cell;
    [self loadImageWithUrlString:self.model.imageUrl];
}

@end
