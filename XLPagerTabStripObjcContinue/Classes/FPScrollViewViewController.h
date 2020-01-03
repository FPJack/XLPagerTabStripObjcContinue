//
//  FPScrollViewViewController.h
//  XLPagerTabStrip_Example
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MXScrollView;
NS_ASSUME_NONNULL_BEGIN
@interface FPScrollViewViewController : UIViewController
@property (nonatomic) CGFloat minimumHeight;
@property (nonatomic,assign)CGFloat headerHeight;
@property (nonatomic, strong, nullable) UIView *headerView;
@property (nonatomic, strong, nullable) UIViewController *headerViewController;
@property (nonatomic, strong, nullable) UIViewController *childViewController;
@property (nonatomic,strong,readonly)MXScrollView *scrollView;
- (void)reloadHeaderHeight;
@end
NS_ASSUME_NONNULL_END
