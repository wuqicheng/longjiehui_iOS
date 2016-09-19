//
//  LoginVC.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/23.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "LoginVC.h"
#import "Define.h"
#import "Masonry.h"
#import "RegisterVC.h"

@interface LoginVC ()<UITextFieldDelegate>

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableArray *images = [NSMutableArray new];
//    
//    [images addObject:[UIImage imageNamed:@"guide1"]];
//    [images addObject:[UIImage imageNamed:@"guide2"]];
//    [images addObject:[UIImage imageNamed:@"guide1"]];
//    
//    [[HcdGuideViewManager sharedInstance] showGuideViewWithImages:images
//                                                   andButtonTitle:@"START"
//                                              andButtonTitleColor:[UIColor blackColor]
//                                                 andButtonBGColor:[UIColor whiteColor]
//                                             andButtonBorderColor:[UIColor whiteColor]];
    
    
    // Do any additional setup after loading the view from its nib.
    //    UIImageView *bgimg = [UIImageView new];
    //    bgimg.image = [UIImage imageNamed:@"wd"];
    //    bgimg.frame = CGRectMake(50, 100, 22,20);
    //    [self.view addSubview:bgimg];
    //
    //    UIImageView *bgimg1 = [UIImageView new];
    //    bgimg1.image = [UIImage imageNamed:@"mm"];
    //    bgimg1.frame = CGRectMake(50, 200, 22, 20);
    //    [self.view addSubview:bgimg1];
    
    
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



- (void)initView {
    UIImageView *bgimg = [UIImageView new];
    bgimg.image = [UIImage imageNamed:@"bg"];
    bgimg.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:bgimg];
    
    UIImageView *logoimg = [UIImageView new];
    logoimg.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoimg];
    [logoimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(96);
    }];
    
    UIView *outline = [UIView new];
    outline.backgroundColor = [UIColor whiteColor];
    outline.layer.cornerRadius = 2.5;
    [self.view addSubview:outline];
    [outline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.height.mas_equalTo(80);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(logoimg.mas_bottom).offset(56);
    }];
    
    
    UITextField *phoneNmub = [UITextField new];
    phoneNmub.delegate = self;
    phoneNmub.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneNmub.font = [UIFont fontWithName:@"PingFang SC" size:14];
    phoneNmub.placeholder = @"请输入手机号码";
    [self.view addSubview:phoneNmub];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 45, 40)];
    left.image = [UIImage imageNamed:@"user"];
    left.contentMode = UIViewContentModeCenter;
    phoneNmub.leftView = left;
    phoneNmub.leftViewMode = UITextFieldViewModeAlways;
    phoneNmub.backgroundColor = [UIColor whiteColor];
    phoneNmub.keyboardType = UIKeyboardTypeNumberPad;
    phoneNmub.layer.cornerRadius = 2.5;
    [phoneNmub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.top.mas_equalTo(outline);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(40);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:205.0/255.0 green:205.0/255.0 blue:205.0/255.0 alpha:1.0f];
    [outline addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.centerY.mas_equalTo(outline);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(1);
    }];
    
    
    UITextField *passWord = [UITextField new];
    passWord.delegate = self;
    
    passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    passWord.font = [UIFont fontWithName:@"PingFang SC" size:14];
    passWord.placeholder = @"请输入密码";
    passWord.keyboardType = UIKeyboardTypeASCIICapable;
    [self.view addSubview:passWord];
    left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    left.image = [UIImage imageNamed:@"searchq"];
    left.contentMode = UIViewContentModeCenter;
    //    vlayer = [self getGradientLayer:CGRectMake(40, 3, 1, 34)];
    //    [left.layer addSublayer:vlayer];
    
    passWord.leftView = left;
    passWord.leftViewMode = UITextFieldViewModeAlways;
    
    // 输入框右侧隐藏密码按钮
    //    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    //    right.image = [UIImage imageNamed:@"隐藏密码"];
    //    right.contentMode = UIViewContentModeCenter;
    //    password.rightView = right;
    //    password.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(0, 0, 45, 40);
    [right setImage:[UIImage imageNamed:@"隐藏密码"] forState:UIControlStateNormal];
    right.contentMode = UIViewContentModeCenter;
    passWord.rightView = right;
    passWord.rightViewMode = UITextFieldViewModeAlways;
    [right addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
    passWord.secureTextEntry = YES;
    [passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.left.mas_equalTo(outline);
        make.bottom.mas_equalTo(outline);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *loginBtn = [UIButton new];
    loginBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:16];
    loginBtn.layer.cornerRadius = 2.5;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:0.0/255.0 alpha:1.0f];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.left.mas_equalTo(outline);
        make.top.mas_equalTo(outline.mas_bottom).offset(10);
        make.height.mas_equalTo(38);
    }];
    
    UIButton *regisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    regisBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:13];
    [regisBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regisBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regisBtn addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regisBtn];
    [regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(14);
        make.left.mas_equalTo(outline);
    }];
    
    UIButton *forgotPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgotPassword addTarget:self action:@selector(forgotPassword:) forControlEvents:UIControlEventTouchUpInside];
    forgotPassword.titleLabel.font  = [UIFont fontWithName:@"PingFang SC" size:13];
    [forgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgotPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [self.view addSubview:forgotPassword];
    [forgotPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(regisBtn);
        make.right.mas_equalTo(outline);
        
    }];
    
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor colorWithRed:99.0/255.0 green:103.0/255.0 blue:104.0/255.0 alpha:1.0f];
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(regisBtn.mas_bottom).offset(28);
        make.left.mas_equalTo(32);
        make.width.mas_equalTo(76);
    }];
    
    UILabel *label1 = [UILabel new];
    label1.text = @"第三方登录";
    label1.font = [UIFont fontWithName:@"PingFang SC" size:13];
    label1.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.centerY.mas_equalTo(line1);
    }];
    
    UIView *line2 = [UIView new];
    line2.backgroundColor = line1.backgroundColor;
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(line1);
        make.top.mas_equalTo(line1);
        make.right.mas_equalTo(-32);
        make.width.mas_equalTo(line1);
    }];
    
    UIButton *weibo = [UIButton new];
    [weibo setImage:[UIImage imageNamed:@"wb"] forState:UIControlStateNormal];
    [weibo addTarget:self action:@selector(weiboLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weibo];
    [weibo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(line1.mas_bottom).offset(24);
    }];
    
    UIButton *weixin = [UIButton new];
    [weixin setImage:[UIImage imageNamed:@"wx"] forState:UIControlStateNormal];
    [weixin addTarget:self action:@selector(weixinLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weixin];
    [weixin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.top.mas_equalTo(weibo);
    }];
    
    UIButton *qq = [UIButton new];
    [qq setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [qq addTarget:self action:@selector(qqLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qq];
    [qq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(weibo);
    }];
    
    
    
}

- (void)hide:(BOOL)animated {
}

-(void)login:(UIButton *)sender{
    
}

-(void)regist:(UIButton *)sender{
    RegisterVC *vc = [RegisterVC new];
    vc.isZhuce = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)forgotPassword:(UIButton *)sender{
    RegisterVC *vc = [RegisterVC new];
    vc.isZhuce = NO;
    [self.navigationController pushViewController:vc animated:YES];

    
    
}

-(void)weiboLogin:(UIButton *)sender{
    RegisterVC *vc = [RegisterVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)weixinLogin:(UIButton *)sender{
    
}

-(void)qqLogin:(UIButton *)sender{
    
}


//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    if (!textField.window.isKeyWindow) {
//        [textField.window makeKeyAndVisible];
//    }
//}


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
