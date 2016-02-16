//
//  OrientationLayout.h
//  CollectionViewDemo
//
//  Created by Shou Cheng Tuan on 2016/2/15.
//  Copyright © 2016年 Shou Cheng Tuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LayoutType) {
    LayoutTypeOne,
    LayoutTypeFour,
    LayoutTypeNine,
    LayoutTypeSixteen
};

@interface OrientationLayout : UICollectionViewFlowLayout

@property LayoutType layoutType;

@end
