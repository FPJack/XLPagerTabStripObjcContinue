//
//  KLCustomButtonBarPagerTabStripVC.m
//  HROA
//
//  Created by kuailework on 2017/4/15.
//  Copyright © 2017年 Kuailework. All rights reserved.
//

#import "KLCustomButtonBarPagerTabStripVC.h"
#import <JYEqualCellSpaceFlowLayout.h>


//#import "UIColor+KLColor.h"
//#import "KLDealSegementCell.h"

static const CGFloat kSegemnetHeight = 44;

@interface KLCustomButtonBarPagerTabStripVC ()
@property (strong, nonatomic) XLButtonBarView * buttonBarView;
//@property (nonatomic,strong)NSMutableArray *cells;
@end

@interface KLCustomButtonBarPagerTabStripVC ()

@end

@implementation KLCustomButtonBarPagerTabStripVC
@synthesize buttonBarView = _buttonBarView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.delegate = self;
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.leftRightMargin = 0;
//    self.title = self.customTitle;
//    [self customTabs];
}
//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    self.containerView.scrollEnabled = YES;
//    self.containerView.bounces = NO
//    ;
//}
//- (void)customTabs{
//    self.isProgressiveIndicator = YES;
//    [self.buttonBarView setBackgroundColor:[UIColor whiteColor]];
//    self.buttonBarView.selectedBarHeight = 2;
//    self.buttonBarView.labelFont = [UIFont systemFontOfSize:12];
//    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
//    self.buttonBarView.leftRightMargin = 0;
//    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
//    self.buttonBarView.selectedBar.backgroundColor = [UIColor redColor];
//    self.buttonBarView.selectedBar.hidden = NO;
//    self.delegate = self;
////   [self.buttonBarView removeFromSuperview];
//
//    __weak KLCustomButtonBarPagerTabStripVC *weakSelf = self;
//    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
//
//
//        [weakSelf.cells enumerateObjectsUsingBlock:^(XLButtonBarViewCell   *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            if ([newCell isEqual:obj]) {
//                [obj.label setTextColor:[UIColor  redColor]];
//
//            }else{
//                [obj.label setTextColor:[UIColor blackColor]];
//
//            }
//
//        }];
//    };
//
//
//    [self.view addSubview:self.buttonBarView];
//    self.containerView.scrollEnabled = NO;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    self.buttonBarView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), kSegemnetHeight);
//    self.containerView.frame = CGRectMake(0, kSegemnetHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - kSegemnetHeight);
//}
//
//#pragma mark - Properties
//#pragma mark - 重写父类的方法
-(XLButtonBarView *)buttonBarView
{
    if (_buttonBarView) return _buttonBarView;

    // If _buttonBarView is nil then it wasn't configured in a XIB or storyboard so
    // this class is being used programmatically. We need to initialise the buttonBarView,
    // setup some sensible defaults (which can of course always be re-set in the sub-class),
    // and set an appropriate frame. The buttonBarView gets added to to the view in viewDidLoad:
  
    JYEqualCellSpaceFlowLayout *flowLayout = [[JYEqualCellSpaceFlowLayout alloc] initWithType:AlignWithCenter betweenOfCell:50];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    _buttonBarView = [[XLButtonBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f) collectionViewLayout:flowLayout];
    _buttonBarView.backgroundColor = [UIColor orangeColor];
    _buttonBarView.selectedBar.backgroundColor = [UIColor blackColor];
    _buttonBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    // If a XIB or storyboard hasn't been used we also need to register the cell reuseIdentifier
    // as well otherwise we'll get a crash when the code attempts to dequeue any cell's
    NSBundle * bundle = [NSBundle bundleForClass:[XLButtonBarView class]];
    NSURL * url = [bundle URLForResource:@"XLPagerTabStrip" withExtension:@"bundle"];
    if (url){
        bundle =  [NSBundle bundleWithURL:url];
    }
    [_buttonBarView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:bundle] forCellWithReuseIdentifier:@"Cell"];
    // If a XIB or storyboard hasn't been used then the containView frame that was setup in the
    // XLPagerTabStripViewController won't have accounted for the buttonBarView. So we need to adjust
    // its y position (and also its height) so that childVC's don't appear under the buttonBarView.
    CGRect newContainerViewFrame = self.containerView.frame;
    newContainerViewFrame.origin.y = 44.0f;
    newContainerViewFrame.size.height = self.containerView.frame.size.height - (44.0f - self.containerView.frame.origin.y);
    self.containerView.frame = newContainerViewFrame;

    return _buttonBarView;
}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    XLButtonBarViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    if (self.cells == nil) {
//        self.cells = [NSMutableArray array];
//    }
//    [self.cells addObject:cell];
//    UIViewController<XLPagerTabStripChildItem> * childController =   [self.pagerTabStripChildViewControllers objectAtIndex:indexPath.item];
//
//    [cell.label setText:[childController titleForPagerTabStripViewController:self]];
//    cell.label.font = [UIFont systemFontOfSize:17];
//    if (self.buttonBarView.labelFont) {
////        buttonBarCell.label.font = self.buttonBarView.labelFont;
//    }
//
////    if ([childController respondsToSelector:@selector(imageForPagerTabStripViewController:)]) {
////        UIImage *image = [childController imageForPagerTabStripViewController:self];
////        buttonBarCell.imageView.image = image;
////    }
////
////    if ([childController respondsToSelector:@selector(highlightedImageForPagerTabStripViewController:)]) {
////        UIImage *image = [childController highlightedImageForPagerTabStripViewController:self];
////        buttonBarCell.imageView.highlightedImage = image;
////    }
////
//    if (self.isProgressiveIndicator) {
//        if (self.changeCurrentIndexProgressiveBlock) {
//            self.changeCurrentIndexProgressiveBlock(self.currentIndex == indexPath.item ? nil : cell , self.currentIndex == indexPath.item ? cell : nil, 1, YES, NO);
//        }
//    }
//    else{
//        if (self.changeCurrentIndexBlock) {
//            self.changeCurrentIndexBlock(self.currentIndex == indexPath.item ? nil : cell , self.currentIndex == indexPath.item ? cell : nil, NO);
//        }
//    }
//
//    return cell;
//}
//
//#pragma mark - XLPagerTabStripChildItem
//- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
//    return self.title ? self.title : @"";
//}
//
#pragma mark - XLPagerTabStripViewControllerDataSource
-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    if (self.VCs) {
        return self.VCs;
    }
    return @[self];
}
@end
