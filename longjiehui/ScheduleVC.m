//
//  ScheduleVC.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/20.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "ScheduleVC.h"
#import "Define.h"
#import "Masonry.h"
#import "MyCodeVC.h"

#define time 0.3f

@interface ScheduleVC (){
    UIImageView *_imageviewLeft;
    UIImageView *_imageviewRight;
}

@end

@implementation ScheduleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view from its nib.
    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
    
}

-(void)initUI{
    
    UIView *bkview = [UIView new];
    bkview.backgroundColor = [UIColor whiteColor];
    bkview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:bkview];
    
    UIButton *qiangdan = [UIButton new];
    [qiangdan setBackgroundImage:[UIImage imageNamed:@"抢单"] forState:UIControlStateNormal];
    [bkview addSubview:qiangdan];
    [qiangdan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).offset(-49);
    }];
    UILabel *qdLabel = [UILabel new];
    qdLabel.text = @"抢单";
    qdLabel.font = [UIFont fontWithName:@"PingFang SC" size:23];
    [bkview addSubview:qdLabel];
    [qdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(qiangdan.mas_bottom).offset(10);
    }];
    
    UIButton *daifukuan = [UIButton new];
    [daifukuan setBackgroundImage:[UIImage imageNamed:@"待付款1"] forState:UIControlStateNormal];
    [daifukuan addTarget:self action:@selector(goToMyCode:) forControlEvents:UIControlEventTouchUpInside];
    [bkview addSubview:daifukuan];
    [daifukuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(qiangdan);
        make.bottom.mas_equalTo(qiangdan.mas_top).offset(-47);
    }];
    UILabel *dfkLabel = [UILabel new];
    dfkLabel.text = @"待付款";
    dfkLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:dfkLabel];
    [dfkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(daifukuan.mas_bottom).offset(6);
    }];
    
    UIButton *daifahuo = [UIButton new];
    [daifahuo setBackgroundImage:[UIImage imageNamed:@"待发货"] forState:UIControlStateNormal];
    [bkview addSubview:daifahuo];
    [daifahuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(daifukuan.mas_top).offset(20);
        make.right.mas_equalTo(-50);
    }];
    UILabel *dfhLabel = [UILabel new];
    dfhLabel.text = @"待发货";
    dfhLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:dfhLabel];
    [dfhLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(daifahuo);
        make.top.mas_equalTo(daifahuo.mas_bottom).offset(6);
    }];
    
    UIButton *daishouhuo = [UIButton new];
    [daishouhuo setBackgroundImage:[UIImage imageNamed:@"待收货"] forState:UIControlStateNormal];
    [bkview addSubview:daishouhuo];
    [daishouhuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(qiangdan);
    }];
    UILabel *dshLabel = [UILabel new];
    dshLabel.text = @"待收货";
    dshLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:dshLabel];
    [dshLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(daishouhuo);
        make.top.mas_equalTo(daishouhuo.mas_bottom).offset(6);
    }];
    
    UIButton *daipingjia = [UIButton new];
    [daipingjia setBackgroundImage:[UIImage imageNamed:@"待评价"] forState:UIControlStateNormal];
    [bkview addSubview:daipingjia];
    [daipingjia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(daifahuo);
        make.top.mas_equalTo(daishouhuo.mas_bottom).offset(51);
    }];
    UILabel *dpjLabel = [UILabel new];
    dpjLabel.text = @"待评价";
    dpjLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:dpjLabel];
    [dpjLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(daipingjia);
        make.top.mas_equalTo(daipingjia.mas_bottom).offset(6);
    }];
    
    UIButton *beiwanglu = [UIButton new];
    [beiwanglu setBackgroundImage:[UIImage imageNamed:@"备忘录"] forState:UIControlStateNormal];
    [bkview addSubview:beiwanglu];
    [beiwanglu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(qiangdan);
        make.top.mas_equalTo(qiangdan.mas_bottom).offset(67);
    }];
    UILabel *bwlLabel = [UILabel new];
    bwlLabel.text = @"备忘录";
    bwlLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:bwlLabel];
    [bwlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(beiwanglu);
        make.top.mas_equalTo(beiwanglu.mas_bottom).offset(6);
    }];
    
    UIButton *wodeshoucang = [UIButton new];
    [wodeshoucang setBackgroundImage:[UIImage imageNamed:@"我的收藏"] forState:UIControlStateNormal];
    [bkview addSubview:wodeshoucang];
    [wodeshoucang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(daipingjia);
        make.left.mas_equalTo(50);
    }];
    UILabel *wdscLabel = [UILabel new];
    wdscLabel.text = @"我的收藏";
    wdscLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:wdscLabel];
    [wdscLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(wodeshoucang);
        make.top.mas_equalTo(wodeshoucang.mas_bottom).offset(6);
    }];
    
    UIButton *tuikuan = [UIButton new];
    [tuikuan setBackgroundImage:[UIImage imageNamed:@"退款"] forState:UIControlStateNormal];
    [bkview addSubview:tuikuan];
    [tuikuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(qiangdan);
        make.left.mas_equalTo(15);
    }];
    UILabel *tkLabel = [UILabel new];
    tkLabel.text = @"退款／售后";
    tkLabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:tkLabel];
    [tkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(tuikuan);
        make.top.mas_equalTo(tuikuan.mas_bottom).offset(6);
    }];
    
    UIButton *daichuli = [UIButton new];
    [daichuli setBackgroundImage:[UIImage imageNamed:@"待处理"] forState:UIControlStateNormal];
    [bkview addSubview:daichuli];
    [daichuli mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(daifahuo);
        make.left.mas_equalTo(50);
    }];
    UILabel *dclabel = [UILabel new];
    dclabel.text = @"待处理";
    dclabel.font = [UIFont fontWithName:@"PingFang SC" size:14];
    [bkview addSubview:dclabel];
    [dclabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(daichuli);
        make.top.mas_equalTo(daichuli.mas_bottom).offset(6);
    }];
    
}

-(void)goToMyCode:(UIButton *)sender{
    MyCodeVC *myCode = [MyCodeVC new];
    [self.navigationController pushViewController:myCode animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    /********用于创建pan********/       //将左右的tab页面绘制出来，并把UIView添加到当前的self.view中
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    UIViewController* v1 = [self.tabBarController.viewControllers objectAtIndex:selectedIndex-1];
    UIImage* image1 = [self imageByCropping:v1.view toRect:v1.view.bounds];
    _imageviewLeft = [[UIImageView alloc] initWithImage:image1];
    _imageviewLeft.frame = CGRectMake(_imageviewLeft.frame.origin.x - [UIScreen mainScreen].bounds.size.width, _imageviewLeft.frame.origin.y , _imageviewLeft.frame.size.width, _imageviewLeft.frame.size.height);
    [self.view addSubview:_imageviewLeft];
    
    UIViewController* v2 = [self.tabBarController.viewControllers objectAtIndex:selectedIndex+1];
    UIImage* image2 = [self imageByCropping:v2.view toRect:v2.view.bounds];
    _imageviewRight = [[UIImageView alloc] initWithImage:image2];
    _imageviewRight.frame = CGRectMake(_imageviewRight.frame.origin.x + [UIScreen mainScreen].bounds.size.width, 0, _imageviewRight.frame.size.width, _imageviewRight.frame.size.height);
    [self.view addSubview:_imageviewRight];
    /********用于创建pan********/
}

- (void)viewDidDisappear:(BOOL)animated{
    /********用于移除pan时的左右两边的view********/
    [_imageviewLeft removeFromSuperview];
    [_imageviewRight removeFromSuperview];
    /********用于移除pan时的左右两边的view********/
}

#pragma mark 绘制图片
//与pan结合使用 截图方法，图片用来做动画
-(UIImage*)imageByCropping:(UIView*)imageToCrop toRect:(CGRect)rect
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGSize pageSize = CGSizeMake(scale*rect.size.width, scale*rect.size.height) ;
    UIGraphicsBeginImageContext(pageSize);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), scale, scale);
    
    CGContextRef resizedContext =UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(resizedContext,-1*rect.origin.x,-1*rect.origin.y);
    [imageToCrop.layer renderInContext:resizedContext];
    UIImage*imageOriginBackground =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageOriginBackground = [UIImage imageWithCGImage:imageOriginBackground.CGImage scale:scale orientation:UIImageOrientationUp];
    
    return imageOriginBackground;
}

#pragma mark Pan手势
- (void) handlePan:(UIPanGestureRecognizer*)recongizer{
    NSLog(@"UIPanGestureRecognizer");
    
    NSUInteger index = [self.tabBarController selectedIndex];
    
    CGPoint point = [recongizer translationInView:self.view];
    NSLog(@"%f,%f",point.x,point.y);
    
    recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
    [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recongizer.state == UIGestureRecognizerStateEnded) {
        if (recongizer.view.center.x < [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                
            }];
        } else if (recongizer.view.center.x <= 0 ){
            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [self.tabBarController setSelectedIndex:index+1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        } else {
            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width*1.5 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [self.tabBarController setSelectedIndex:index-1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        }
    }
}

@end
