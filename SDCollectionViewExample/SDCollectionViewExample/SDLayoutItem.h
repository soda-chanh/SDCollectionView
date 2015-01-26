//
//  SDLayoutItem.h
//  SDCollectionViewExample
//
//  Created by Stacey Dao on 1/25/15.
//  Copyright (c) 2015 Stacey Dao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SDLayoutItem : NSObject

@property (assign, nonatomic) Class cellControllerClass;
@property (strong, nonatomic) NSString *nibName;
@property (assign, nonatomic) CGSize size;

- (instancetype)initWithCellControllerClass:(Class)cellControllerClass nibName:(NSString *)nibName;

@end
