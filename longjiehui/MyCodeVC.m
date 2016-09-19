//
//  MyCodeVC.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/9/2.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "MyCodeVC.h"
#import "SegmentViewController.h"
#import "ExampleViewController.h"
#import "Define.h"

static CGFloat const ButtonHeight = 50;

@interface MyCodeVC ()

@end

@implementation MyCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    
    SegmentViewController *vc = [[SegmentViewController alloc]init];
    NSArray *titleArray = @[@"全部", @"待付款", @"待发货", @"待收货", @"待评价", @"退款"];
    vc.titleArray = titleArray;
    NSMutableArray *controlArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < vc.titleArray.count; i ++) {
        ExampleViewController *vc = [[ExampleViewController alloc]initWithIndex:i title:titleArray[i]];
        [controlArray addObject:vc];
    }
    vc.titleSelectedColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1.0];
    vc.subViewControllers = controlArray;
    vc.buttonWidth = 80;
    vc.buttonHeight = ButtonHeight;
    [vc initSegment];
    [vc addParentController:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
