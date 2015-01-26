//
//  SDStackCellController.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDStackCellController.h"


@interface SDStackCellController() <UIGestureRecognizerDelegate>
@end


@implementation SDStackCellController

+ (NSString *)cellReuseIdentifier
{
    return @"SDStackViewCell";
}


#pragma mark - Private

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

@end