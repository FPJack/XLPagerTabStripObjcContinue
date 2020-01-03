//
//  XLViewController.m
//  XLPagerTabStrip
//
//  Created by FPJack on 12/31/2019.
//  Copyright (c) 2019 FPJack. All rights reserved.
//

#import "XLViewController.h"
#import "MXScrollViewVC.h"
#import "MXScrollViewSubVC.h"
#import "XLPagerTabStripViewController.h"
#import "KLCustomButtonBarPagerTabStripVC.h"
#import "KLCustomSubVC.h"
#import "KLCustomHeaderVC.h"
@interface XLViewController ()
@property (nonatomic,strong)KLCustomButtonBarPagerTabStripVC *pagerTabVC;
@property (nonatomic,strong)KLCustomHeaderVC *headerVC;
@property (nonatomic,strong)MXScrollViewSubVC *VC;
@end
@implementation XLViewController
- (KLCustomButtonBarPagerTabStripVC *)pagerTabVC{
    if (!_pagerTabVC) {
        _pagerTabVC = [[KLCustomButtonBarPagerTabStripVC alloc]init];
        NSMutableArray *VCs = [NSMutableArray array];
        {
            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
            vc.title = @"vc1";
            [VCs addObject:vc];
        }
        {
            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
            vc.title = @"vc2";
            [VCs addObject:vc];
        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vc3";
//            [VCs addObject:vc];
//        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vc4";
//            [VCs addObject:vc];
//        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vkkkkkc1";
//            [VCs addObject:vc];
//        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vc2";
//            [VCs addObject:vc];
//        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vc3";
//            [VCs addObject:vc];
//        }
//        {
//            KLCustomSubVC *vc = [[KLCustomSubVC alloc]init];
//            vc.title = @"vcuuuuuuuuu4";
//            [VCs addObject:vc];
//        }

        _pagerTabVC.VCs = VCs;
    }
    return _pagerTabVC;
}
- (KLCustomHeaderVC *)headerVC{
    if (!_headerVC) {
        _headerVC = [KLCustomHeaderVC new];
    }
    return _headerVC;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserverForName:@"tap" object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification * _Nonnull note) {
        self.VC.headerHeight = self.VC.headerHeight == 200 ? 250 : 200;
        [self.VC reloadHeaderHeight];
    }];
}
- (IBAction)tapAction:(id)sender {
    MXScrollViewSubVC *vc = [MXScrollViewSubVC new];
    vc.childViewController = self.pagerTabVC;
    vc.headerHeight = 200;
//    vc.minimumHeight = 50;
//    vc.scrollView.bounces = NO;
//    vc.headerViewController = [KLCustomHeaderVC new];
    vc.headerView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yangquanxuzhi"]];
    self.VC = vc;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
