//
//  SDLayoutItem.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDLayoutItem.h"

@implementation SDLayoutItem

- (instancetype)initWithCellControllerClass:(Class)cellControllerClass nibName:(NSString *)nibName
{
    if (self = [super init]) {
        _cellControllerClass = cellControllerClass;
        _nibName = nibName;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Class: %@ \n Nib: %@ \n Size: %@", NSStringFromClass(_cellControllerClass), _nibName, NSStringFromCGSize(_size)];
}

@end
