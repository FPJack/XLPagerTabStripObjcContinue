//
//  FPButtonBarPagerTabStripiewController.h
//  XLPagerTabStrip_Example
//
//  Created by fanpeng on 2020/1/2.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "XLButtonBarPagerTabStripViewController.h"
#import "JYEqualCellSpaceFlowLayout.h"
NS_ASSUME_NONNULL_BEGIN
@interface FPButtonBarPagerTabStripiewController : XLButtonBarPagerTabStripViewController
@property (nonatomic,assign)AlignType titleCellAlignType;//cell对齐方式
@property (nonatomic,assign)CGFloat betweenOfCellSpace;//cell之间间距
@end
NS_ASSUME_NONNULL_END
