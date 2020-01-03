//
//  MXScrollViewSubVC.m
//  XLPagerTabStrip_Example
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "MXScrollViewSubVC.h"
#import <UIScrollView+Refresh.h>
#import <MXScrollView.h>
#import <MJRefresh/MJRefresh.h>
@interface MXScrollViewSubVC ()

@end

@implementation MXScrollViewSubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.scrollView.bounces = NO;
    self.scrollView.headerCanRefresh = YES;
    self.scrollView.refreshBlock = ^(RefreshType type) {
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self.scrollView end_Refresh];
         });
     };
    self.scrollView.mj_header.ignoredScrollViewContentInsetTop = self.headerHeight;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"MXScrollViewSubVC-viewWillAppear");
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"MXScrollViewSubVC-viewWillDisappear");

}

@end
