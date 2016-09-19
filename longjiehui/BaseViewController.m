//
//  BaseViewController.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/20.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "BaseViewController.h"
#import "Define.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIImageView *navBarHairlineImageView;

@end

@implementation BaseViewController


//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navBarHairlineImageView.hidden = YES;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navBarHairlineImageView.hidden = NO;
//}


- (void)viewDidLoad {
    
    
   
    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    
//    self.view.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0f];
    [self customerBack];
//    /**
//     *  隐藏导航条分割线
//     */
//    self.navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
//    /**
//     *  设置标题字体颜色大小
//     */
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont fontWithName:@"Pingfang HC" size:38]};
//    
//    /**
//     *  左侧返回按钮
//     */
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fh"] style:UIBarButtonItemStylePlain target:self action:@selector(handleBack:)];
//    self.navigationItem.leftBarButtonItem = leftItem;
//    
//    
}
//
//
//- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
//    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
//        return (UIImageView *)view;
//    }
//    for (UIView *subview in view.subviews) {
//        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
//        if (imageView) {
//            return imageView;
//        }
//    }
//    return nil;
//}
//
-(void)customerBack{
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.view.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0f];
    
}
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:kString(@"") style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.backBarButtonItem = backButton;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
//
//- (CAGradientLayer *)getGradientLayer:(CGRect)rect{
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = rect;
//    gradient.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,
//                       (id)[UIColor blueColor].CGColor,
//                       (id)[UIColor clearColor].CGColor,nil];
//    return gradient;
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///**
// *  返回按钮
// */
//- (void)handleBack:(UIBarButtonItem *)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
