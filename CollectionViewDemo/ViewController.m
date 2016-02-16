//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Shou Cheng Tuan on 2016/2/15.
//  Copyright © 2016年 Shou Cheng Tuan. All rights reserved.
//

#import "ViewController.h"
#import "TransitionManager.h"

#define CELL_ID      @"CELL_ID"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) TransitionManager *transitionManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(trainsitionLayout:)];
    
    [self.navigationItem setRightBarButtonItem:item];
    
    [self initCollectionViewLayout];
    
    [self initTransitionManager];
    
    [self configureCollectionView];
}

- (void)initCollectionViewLayout
{
    UICollectionViewFlowLayout *grid = [[UICollectionViewFlowLayout alloc] init];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    grid.itemSize = CGSizeMake(screenSize.width, screenSize.height*0.5f);
    grid.sectionInset = UIEdgeInsetsMake(10.0, 0.0, 10.0, 0.0);
    grid.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.collectionViewLayout = grid;
    
    
}

- (void)initTransitionManager
{
    TransitionManager *transitionManager = [[TransitionManager alloc] initWithCollectionView:self.collectionView];
    
    self.transitionManager = transitionManager;
}

- (void)configureCollectionView
{
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
    self.collectionView.pagingEnabled = YES;
}

#pragma mark - Action

- (void)trainsitionLayout:(id)sender
{
    [self.transitionManager trainsitionLayout];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    
    // set the cell to use a color swatch
    CGFloat hue = ((CGFloat)indexPath.item)/24;
    UIColor *cellColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    cell.contentView.backgroundColor = cellColor;
    
    return cell;
}

@end
