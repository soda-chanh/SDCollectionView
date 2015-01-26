//
//  SDCellController.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDBaseCellController.h"
#import "SDBaseCollectionViewCell.h"

@interface SDBaseCellController() <UIGestureRecognizerDelegate>

+ (NSString *)cellReuseIdentifier;
@end

@implementation SDBaseCellController

- (void)dealloc
{
    self.model = nil;
    self.delegate = nil;
}

- (void)cellWillPrepareForReuse:(SDBaseCollectionViewCell *)cell
{
    [cell.contentView removeGestureRecognizer:self.singleTapRecognizer];
    _collectionViewCell = nil;
}

#pragma mark - Properties

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([SDBaseCollectionViewCell class]);
}

- (SDBaseCollectionViewCell *)cell
{
    return (SDBaseCollectionViewCell *)_collectionViewCell;
}

- (void)setCell:(SDBaseCollectionViewCell *)cell
{
    _collectionViewCell = cell;
}

- (UITapGestureRecognizer *)singleTapRecognizer
{
    if(!_singleTapRecognizer) {
        _singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSingleTapCell:)];
        _singleTapRecognizer.delegate = self;
    }
    return _singleTapRecognizer;
}

#pragma mark - Actions

- (void)didSingleTapCell:(UITapGestureRecognizer *)recognizer
{
    if ([self.delegate respondsToSelector:@selector(cellController:didSelectBoardCollectionViewCell:model:)]) {
        [self.delegate cellController:self didSelectBoardCollectionViewCell:[self cell] model:self.model];
    }
}

#pragma mark - Private


- (void)configureCell:(SDBaseCollectionViewCell *)cell withModel:(NSObject *)model
{
    self.cell = cell;
}

- (void)loadImageWithUrlString:(NSString *)imageUrlString
{
    if (imageUrlString && imageUrlString.length > 0) {
        self.cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlString]]];
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass:[UIControl class]]) {
        return NO;
    }
    return YES;
}

@end