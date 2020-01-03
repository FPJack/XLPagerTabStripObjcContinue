//
//  MXScrollViewVC.h
//  test
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <MXParallaxHeader/MXParallaxHeader.h>
#import <MXParallaxHeader/MXScrollViewController.h>
NS_ASSUME_NONNULL_BEGIN

@interface MXScrollViewVC : UIViewController
@property (nonatomic) CGFloat minimumHeight;
@property (nonatomic,assign)CGFloat headerHeight;
@property (nonatomic, strong, nullable) UIView *headerView;
@property (nonatomic, strong, nullable) UIViewController *headerViewController;
@property (nonatomic, strong, nullable) UIViewController *childViewController;
@property (nonatomic,strong,readonly)MXScrollView *scrollView;
@end
NS_ASSUME_NONNULL_END
