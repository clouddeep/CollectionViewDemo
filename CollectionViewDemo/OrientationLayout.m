//
//  OrientationLayout.m
//  CollectionViewDemo
//
//  Created by Shou Cheng Tuan on 2016/2/15.
//  Copyright © 2016年 Shou Cheng Tuan. All rights reserved.
//

#import "OrientationLayout.h"

@implementation OrientationLayout

- (id)init
{
    if (self = [super init]) {
        _layoutType = LayoutTypeOne;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLayout:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    if (_layoutType == LayoutTypeOne) {
        [self prepareLayoutForOrientation];
    } else if (_layoutType == LayoutTypeFour) {
        
    } else if (_layoutType == LayoutTypeNine) {
        
    } else if (_layoutType == LayoutTypeSixteen) {
        
    }
}

- (void)prepareLayoutForOrientation
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if ( UIDeviceOrientationIsPortrait( deviceOrientation ) ) {
        
    }else if ( UIDeviceOrientationIsLandscape( deviceOrientation ) ) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        self.itemSize = CGSizeMake(screenSize.width, screenSize.height);
        self.sectionInset = UIEdgeInsetsZero;
    }
}

- (void)changeLayout:(NSNotification *)notification
{
    UIInterfaceOrientation newOrientation =  [UIApplication sharedApplication].statusBarOrientation;
    
    if (UIInterfaceOrientationIsLandscape (newOrientation)) {
        
    }else if (UIInterfaceOrientationIsPortrait(newOrientation)) {
        
    }
}


@end
