//
//  KLCustomButtonBarPagerTabStripVC.h
//  HROA
//
//  Created by kuailework on 2017/4/15.
//  Copyright © 2017年 Kuailework. All rights reserved.
//
#import <XLButtonBarPagerTabStripViewController.h>
#import <FPButtonBarPagerTabStripiewController.h>


@interface KLCustomButtonBarPagerTabStripVC : FPButtonBarPagerTabStripiewController<XLPagerTabStripChildItem>
@property (nonatomic,strong)NSArray *VCs;
@property (nonatomic,copy)NSString *customTitle;
@end
