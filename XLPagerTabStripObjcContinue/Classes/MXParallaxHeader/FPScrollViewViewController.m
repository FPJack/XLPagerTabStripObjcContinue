//
//  FPScrollViewViewController.m
//  XLPagerTabStrip_Example
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPScrollViewViewController.h"
#import <MXParallaxHeader/MXParallaxHeader.h>
#import <MXParallaxHeader/MXScrollView.h>
@interface FPScrollViewViewController ()
@property (nonatomic,strong,readwrite)MXScrollView *scrollView;

@end

@implementation FPScrollViewViewController

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[MXScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor orangeColor];
        /*
         //决定刷新在scrollView顶部还是在子视图顶部
          _scrollView.bounces = NO;
         */        
    }
    return _scrollView;
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = self.view.bounds.size;
    if (self.headerView) {
        self.headerView.frame = CGRectMake(0, -self.headerHeight, self.view.bounds.size.width, self.headerHeight);
    }
    if (self.headerViewController) {
        self.headerViewController.view.frame = CGRectMake(0, -self.headerHeight, self.view.bounds.size.width, self.headerHeight);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    if (self.headerView) [self addHeaderView:self.headerView];
    if (self.headerViewController) [self addHeaderVC:self.headerViewController];
    if (self.childViewController) [self addChildVC:self.childViewController];
    self.scrollView.parallaxHeader.height = self.headerHeight;
    self.scrollView.parallaxHeader.minimumHeight = self.minimumHeight;
}
- (void)addChildVC:(UIViewController*)childViewController{
    if (_childViewController.parentViewController == self) {
        [_childViewController willMoveToParentViewController:nil];
        [_childViewController.view removeFromSuperview];
        [_childViewController removeFromParentViewController];
        [_childViewController didMoveToParentViewController:nil];
    }

    if (childViewController) {
        [childViewController willMoveToParentViewController:self];
        [self addChildViewController:childViewController];

        [self.scrollView addSubview:childViewController.view];
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

        [childViewController.view.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
        [childViewController.view.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
        [childViewController.view.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;

        [childViewController.view.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
        [childViewController.view.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
        [childViewController didMoveToParentViewController:self];
        
        [childViewController.view.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor constant:0].active = YES;;
    }
}
- (void)addHeaderVC:(UIViewController*)headerViewController{
    if (_headerViewController.parentViewController == self) {
        [_headerViewController willMoveToParentViewController:nil];
        [_headerViewController.view removeFromSuperview];
        [_headerViewController removeFromParentViewController];
        [_headerViewController didMoveToParentViewController:nil];
    }
    if (headerViewController) {
        [headerViewController willMoveToParentViewController:self];
        [self addChildViewController:headerViewController];
        [self addHeaderView:headerViewController.view];
        [headerViewController didMoveToParentViewController:self];
    }
}
- (void)addHeaderView:(UIView*)headerView{
    if (_headerView.superview == self.scrollView) {
        [_headerView removeFromSuperview];
    }
    if (!headerView) return;
    [self.scrollView addSubview:headerView];
}
- (void)reloadHeaderHeight{
    if (self.headerView) {
        self.headerView.frame = CGRectMake(CGRectGetMinX(self.headerView.frame), -self.headerHeight, CGRectGetWidth(self.headerView.frame), self.headerHeight);
    }
    if (self.headerViewController) {
        self.headerViewController.view.frame = CGRectMake(CGRectGetMinX(self.headerViewController.view.frame), -self.headerHeight, CGRectGetWidth(self.headerViewController.view.frame), self.headerHeight);
    }
    self.scrollView.parallaxHeader.height = self.headerHeight;
}
@end
