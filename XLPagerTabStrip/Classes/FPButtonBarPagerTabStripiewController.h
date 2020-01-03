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
@property (nonatomic,strong)NSArray *childrenVCs;//子控制器
@property (nonatomic,assign)CGFloat fontSize;
@property (nonatomic,assign)CGFloat selectFontSize;
@property (nonatomic,strong)UIColor *color;
@property (nonatomic,strong)UIColor *selectColor;
@property (nonatomic,assign)AlignType textAlignType;//
@end
NS_ASSUME_NONNULL_END
