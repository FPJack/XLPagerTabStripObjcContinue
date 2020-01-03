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
    self.edgesForExtendedLayout = UIRectEdgeNone;

    if (@available(iOS 11.0, *)) {
        self.containerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {}
}
-(XLButtonBarView *)buttonBarView
{
    if (_buttonBarView) return _buttonBarView;
    JYEqualCellSpaceFlowLayout *flowLayout = [[JYEqualCellSpaceFlowLayout alloc] initWithType:self.titleCellAlignType betweenOfCell:self.betweenOfCellSpace > 0 ? self.betweenOfCellSpace : 0];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _buttonBarView = [[XLButtonBarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0f) collectionViewLayout:flowLayout];
    _buttonBarView.backgroundColor = [UIColor orangeColor];
    _buttonBarView.selectedBar.backgroundColor = [UIColor blackColor];
    _buttonBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    NSBundle * bundle = [NSBundle bundleForClass:[XLButtonBarView class]];
    NSURL * url = [bundle URLForResource:@"XLPagerTabStripObjcContinue" withExtension:@"bundle"];
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
@end
