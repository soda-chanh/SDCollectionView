//
//  ViewController.m
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/24/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import "MainViewController.h"
#import "SDLayoutItem.h"
#import "SDLayoutManager.h"
#import "SDSmallCellController.h"
#import "SDMediumCellController.h"
#import "SDLargeCellController.h"
#import "SDStackCellController.h"
#import "SDModel.h"
#import "SDBaseCollectionViewCell.h"

#define kNumberOfCells 8

@interface MainViewController () <SDCellControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *models;
@property (strong, nonatomic) NSMutableArray *cellControllers;
@property (strong, nonatomic) NSMutableArray *layoutItems;

@end

@implementation MainViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.models = [NSMutableArray array];
    self.cellControllers = [NSMutableArray array];
    self.layoutItems = [NSMutableArray array];
    
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    [self.collectionView registerNib:[UINib nibWithNibName:[SDSmallCellController cellReuseIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[SDSmallCellController cellReuseIdentifier]];
    [self.collectionView registerNib:[UINib nibWithNibName:[SDMediumCellController cellReuseIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[SDMediumCellController cellReuseIdentifier]];
    [self.collectionView registerNib:[UINib nibWithNibName:[SDLargeCellController cellReuseIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[SDLargeCellController cellReuseIdentifier]];
    [self.collectionView registerNib:[UINib nibWithNibName:[SDStackCellController cellReuseIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[SDStackCellController cellReuseIdentifier]];
    
    [self createModels];
    [self createCellControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    self.models = nil;
    self.cellControllers = nil;
    self.layoutItems = nil;
}

#pragma mark - Private

- (void)createModels
{
    for (NSInteger i = 0; i < kNumberOfCells; i++) {
        SDModel *model = [SDModel new];
        model.title = @"Title";
        model.modelDescription = @"Description";
//        model.imageUrl = @"http://i40.tinypic.com/xcm8b4.jpg";
        [self.models addObject:model];
    }
}

- (void)createCellControllers
{
    self.layoutItems = [SDLayoutManager exampleLayoutItems].mutableCopy;
    
    for (NSInteger i = 0; i < self.layoutItems.count; i++) {
        SDLayoutItem *item = self.layoutItems[i];
        SDBaseCellController *controller = (SDBaseCellController *)[[item.cellControllerClass alloc] init];
        controller.model = self.models[i];
        [self.cellControllers addObject:controller];
    }
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDBaseCellController *boardController = [self.cellControllers objectAtIndex:indexPath.row];
    boardController.delegate = self;
    SDBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[boardController.class cellReuseIdentifier] forIndexPath:indexPath];
    [boardController configureCell:cell withModel:boardController.model];
    return cell;
}

#pragma mark - UICollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SDLayoutItem *layoutItem = [self.layoutItems objectAtIndex:indexPath.row];
    CGSize size = layoutItem.size;
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

#pragma mark - SDCellControllerDelegate

- (void)cellController:(SDBaseCellController *)cellController didSelectBoardCollectionViewCell:(SDBaseCollectionViewCell *)cell model:(NSObject *)model
{
    // do something
}

@end
