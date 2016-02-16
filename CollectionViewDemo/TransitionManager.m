//
//  TransitionManager.m
//  CollectionViewDemo
//
//  Created by Shou Cheng Tuan on 2016/2/15.
//  Copyright © 2016年 Shou Cheng Tuan. All rights reserved.
//

#import "TransitionManager.h"

@interface TransitionManager ()

@property (strong, nonatomic) UICollectionViewFlowLayout *gridLayout;
//Portrait orientation layout.
@property (strong, nonatomic) UICollectionViewFlowLayout *landscapeLayout;
//Landscape orientation has different layout.

@property NSInteger touchCount;
@property NSInteger restoreTouchCount;

@end

@implementation TransitionManager

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    self = [super init];
    if (self != nil)
    {
        self.collectionView = collectionView;
        self.touchCount = 0;
        self.restoreTouchCount = 0;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(oreintationRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
        
        self.gridLayout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NSNotification

- (void)oreintationRotate:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if ( UIDeviceOrientationIsPortrait( deviceOrientation ) )
    {
        [self.collectionView setCollectionViewLayout:self.gridLayout animated:YES];
    }
    else if (UIDeviceOrientationIsLandscape( deviceOrientation ))
    {
        [self.collectionView setCollectionViewLayout:self.landscapeLayout animated:YES];
    }
}

#pragma mark - Transition

- (void)trainsitionLayout
{
    ++self.touchCount;
    self.touchCount = self.touchCount % 4;
    
    [self updateLayout];
}

- (void)updateLayout
{
    if (![self.collectionView.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        return;
    }
    
    UICollectionViewFlowLayout *grid = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    switch (_touchCount) {
        case 0:
            grid.itemSize = CGSizeMake(screenSize.width, screenSize.height*0.5f);
            break;
            
        case 1:
            grid.itemSize = CGSizeMake(screenSize.width*0.5f, screenSize.height*0.5f);
            break;
            
        case 2:
            grid.itemSize = CGSizeMake(screenSize.width/3.0, screenSize.height/3.0);
            break;
            
        default:
            grid.itemSize = CGSizeMake(screenSize.width/4.0, screenSize.height/4.0);
            break;
    }
    
    [self.collectionView setCollectionViewLayout:grid animated:YES];
    self.gridLayout = grid;
}

#pragma mark - Private

- (UICollectionViewFlowLayout *)landscapeLayout
{
    if (!_landscapeLayout) {
        _landscapeLayout = [[UICollectionViewFlowLayout alloc] init];
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _landscapeLayout.itemSize = CGSizeMake(screenSize.width-10, screenSize.height-10);
        _landscapeLayout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
        _landscapeLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _landscapeLayout;
}

@end
