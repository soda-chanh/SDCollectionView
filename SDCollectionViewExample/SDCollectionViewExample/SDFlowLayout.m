//
//  SDFlowLayout.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "SDFlowLayout.h"

@interface SDFlowLayout ()

@property (strong, nonatomic) NSMutableArray *pageFrames;
@property (assign, nonatomic) CGPoint lastOffset;

@end

@implementation SDFlowLayout


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)prepareLayout
{
    [super prepareLayout];
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [super layoutAttributesForElementsInRect:rect].mutableCopy;
    return attributes;
}


#pragma mark - Pagination


- (NSMutableArray *)pageFrames
{
    if (!_pageFrames) {
        _pageFrames = [NSMutableArray array];
        CGFloat y = 0;
        for (NSInteger i = 0; y <= self.collectionView.contentSize.height; i++) {
            CGRect rect = CGRectMake(0, y, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
            [_pageFrames addObject:[NSValue valueWithCGRect:rect]];

            if (i==0) {
                y += (self.collectionView.frame.size.height);
            } else {
                y += (self.collectionView.frame.size.height - self.minimumLineSpacing);
            }
        }
    }
    return _pageFrames;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{    
    CGPoint defaultContentOffset = proposedContentOffset;

    if (proposedContentOffset.y > MAX(0., self.collectionView.contentOffset.y)) {
        proposedContentOffset.y = self.collectionView.contentOffset.y + self.collectionView.bounds.size.height;
    }
    else if (proposedContentOffset.y < self.collectionView.contentOffset.y) {
        proposedContentOffset.y = self.collectionView.contentOffset.y - self.collectionView.bounds.size.height;
    }

    // adjust for the end
    CGFloat remainingYSpace = self.collectionView.contentSize.height - defaultContentOffset.y;
    if (remainingYSpace == self.collectionView.bounds.size.height) {
        return defaultContentOffset;
    }

    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat nextY = proposedContentOffset.y + self.minimumLineSpacing;

    for (NSValue *value in self.pageFrames) {
        CGRect rect = value.CGRectValue;
        CGFloat difference = rect.origin.y - nextY;
        if (ABS(difference) < ABS(offsetAdjustment)) {
            offsetAdjustment = difference;
        }
    }

    proposedContentOffset.y = MIN(proposedContentOffset.y + offsetAdjustment, self.collectionView.contentSize.height - self.collectionView.bounds.size.height);

    // adjust for the beginning
    if (proposedContentOffset.y < 0.) {
        proposedContentOffset.y = 0.;
    }

    self.lastOffset = proposedContentOffset;
    return proposedContentOffset;
}


@end
