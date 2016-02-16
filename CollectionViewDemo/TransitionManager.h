//
//  TransitionManager.h
//  CollectionViewDemo
//
//  Created by Shou Cheng Tuan on 2016/2/15.
//  Copyright © 2016年 Shou Cheng Tuan. All rights reserved.
//

@import UIKit;


@interface TransitionManager : NSObject

@property (nonatomic) BOOL hasActiveInteraction;
@property (nonatomic) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;
- (void)trainsitionLayout;

@end
