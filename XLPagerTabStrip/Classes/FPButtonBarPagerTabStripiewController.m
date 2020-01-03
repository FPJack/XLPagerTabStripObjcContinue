//
//  FPButtonBarPagerTabStripiewController.m
//  XLPagerTabStrip_Example
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPButtonBarPagerTabStripiewController.h"

@interface FPButtonBarPagerTabStripiewController ()

@end

@implementation FPButtonBarPagerTabStripiewController
@synthesize buttonBarView = _buttonBarView;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.containerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {}
}
- (void)customTabs{
    CGFloat fontSize = self.fontSize > 0 ? self.fontSize : 14;
    CGFloat selectFontSize = self.selectFontSize > 0 ? self.selectFontSize : 16;
    UIColor *color = self.color ? self.color : [UIColor blackColor];
    UIColor *selectColor = self.selectColor ? self.selectColor : [UIColor orangeColor];
    [self.buttonBarView setBackgroundColor:[UIColor whiteColor]];
    self.buttonBarView.labelFont = [UIFont systemFontOfSize:fontSize];
    self.buttonBarView.selectedBar.backgroundColor = selectColor;
    self.changeCurrentIndexProgressiveBlock = ^(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL indexWasChanged, BOOL fromCellRowAtIndex) {
        [oldCell.label setTextColor:color];
        oldCell.label.font = [UIFont systemFontOfSize:fontSize];
        [newCell.label setTextColor:selectColor];
        newCell.label.font = [UIFont systemFontOfSize:selectFontSize];
    };
    [self.view addSubview:self.buttonBarView];
}
-(XLButtonBarView *)buttonBarView
{
    if (_buttonBarView) return _buttonBarView;
    UICollectionViewFlowLayout *flowLayout;
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _buttonBarView = [[XLButtonBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f) collectionViewLayout:flowLayout];
    _buttonBarView.backgroundColor = [UIColor orangeColor];
    _buttonBarView.selectedBar.backgroundColor = [UIColor blackColor];
    _buttonBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    NSBundle * bundle = [NSBundle bundleForClass:[XLButtonBarView class]];
    NSURL * url = [bundle URLForResource:@"XLPagerTabStrip" withExtension:@"bundle"];
    if (url){
        bundle =  [NSBundle bundleWithURL:url];
    }
    [_buttonBarView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:bundle] forCellWithReuseIdentifier:@"Cell"];
    CGRect newContainerViewFrame = self.containerView.frame;
    newContainerViewFrame.origin.y = 44.0f;
    newContainerViewFrame.size.height = self.containerView.frame.size.height - (44.0f - self.containerView.frame.origin.y);
    self.containerView.frame = newContainerViewFrame;
    return _buttonBarView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (self.shouldCellsFillAvailableWidth) {
//       return [super collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
//    }
    id<XLPagerTabStripChildItem> vc = self.childrenVCs[indexPath.item];
    NSString *title = [vc titleForPagerTabStripViewController:self];
    CGFloat font = self.selectFontSize > 0 ? self.selectFontSize : 16;
    return CGSizeMake([title boundingRectWithSize:CGSizeMake(MAXFLOAT, 100) options:0 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size.width + self.buttonBarView.leftRightMargin * 2, self.buttonBarView.frame.size.height);
}
#pragma mark - XLPagerTabStripViewControllerDataSource
-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    return self.childrenVCs;
}
@end
