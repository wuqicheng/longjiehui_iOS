//
//  RegisterVC.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/23.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "RegisterVC.h"
#import "Masonry.h"
#import "Define.h"

@interface RegisterVC ()<UITextFieldDelegate>

{ UIImageView *navBarHairlineImageView;}

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [UIImage imageNamed:@"navibg"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsCompact];
    
    [self customerBack];
    
//    /**
//     *  隐藏导航条分割线
//     */
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    /**
     *  左侧返回按钮
     */
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fh"] style:UIBarButtonItemStylePlain target:self action:@selector(handleBack:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];//本页导航条控件颜色；
    [self initView];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
}

-(void)customerBack{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:kString(@"") style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

-(void)handleBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
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
        make.height.mas_equalTo(40*4);
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(logoimg.mas_bottom).offset(25);
    }];
    
    UITextField *phoneNmub = [UITextField new];
    phoneNmub.delegate = self;
    phoneNmub.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneNmub.font = [UIFont fontWithName:@"PingFang SC" size:14];
    phoneNmub.placeholder = @"请输入手机号码";
    [self.view addSubview:phoneNmub];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
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
    
    UITextField *verifyCode = [UITextField new];
    verifyCode.delegate = self;
    verifyCode.font = [UIFont fontWithName:@"PingFang SC" size:14];
    verifyCode.placeholder = @"请输入您的验证码";
    [self.view addSubview:verifyCode];
    left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    left.image = [UIImage imageNamed:@"qr"];
    left.contentMode = UIViewContentModeCenter;
    verifyCode.leftView = left;
    verifyCode.leftViewMode = UITextFieldViewModeAlways;
    verifyCode.backgroundColor = [UIColor whiteColor];
    verifyCode.keyboardType = UIKeyboardTypeNumberPad;
    verifyCode.layer.cornerRadius = 2.5;
    [verifyCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-116);
        make.top.mas_equalTo(phoneNmub.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(40);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithRed:205.0/255.0 green:205.0/255.0 blue:205.0/255.0 alpha:1.0f];
    [self.view  addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.centerY.mas_equalTo(phoneNmub.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *sendCode = [UIButton new];
    sendCode.layer.cornerRadius = 2.5;
    sendCode.layer.borderWidth = 1;
    sendCode.layer.borderColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:0.0/255.0 alpha:1.0f].CGColor;
    [sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [sendCode setTitleColor:[UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:0.0/255.0 alpha:1.0f] forState:UIControlStateNormal];
    sendCode.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:11];
    sendCode.titleLabel.textAlignment = NSTextAlignmentCenter;
    [sendCode addTarget:self action:@selector(sendVerfyCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendCode];
    [sendCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(verifyCode);
        make.right.mas_equalTo(outline.mas_right).offset(-10);
        make.width.mas_equalTo(68);
    }];
    
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor colorWithRed:205.0/255.0 green:205.0/255.0 blue:205.0/255.0 alpha:1.0f];
    [self.view  addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.centerY.mas_equalTo(verifyCode.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(1);
    }];
    
    UITextField *pswd = [UITextField new];
    pswd.delegate = self;
    pswd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pswd.font = [UIFont fontWithName:@"PingFang SC" size:14];
    pswd.placeholder = @"设置密码";
    [self.view addSubview:pswd];
    left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    left.image = [UIImage imageNamed:@"searchq"];
    left.contentMode = UIViewContentModeCenter;
    pswd.leftView = left;
    pswd.leftViewMode = UITextFieldViewModeAlways;
    pswd.backgroundColor = [UIColor whiteColor];
    pswd.keyboardType = UIKeyboardTypeASCIICapable;
    pswd.layer.cornerRadius = 2.5;
    [pswd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.top.mas_equalTo(verifyCode.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(40);
    }];
    
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor colorWithRed:205.0/255.0 green:205.0/255.0 blue:205.0/255.0 alpha:1.0f];
    [self.view  addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.centerY.mas_equalTo(pswd.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(1);
    }];
    
    UITextField *confirmPswd = [UITextField new];
    confirmPswd.delegate = self;
    confirmPswd.clearButtonMode = UITextFieldViewModeWhileEditing;
    confirmPswd.font = [UIFont fontWithName:@"PingFang SC" size:14];
    confirmPswd.placeholder = @"确认密码";
    [self.view addSubview:confirmPswd];
    left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    left.image = [UIImage imageNamed:@"searchq"];
    left.contentMode = UIViewContentModeCenter;
    confirmPswd.leftView = left;
    confirmPswd.leftViewMode = UITextFieldViewModeAlways;
    confirmPswd.backgroundColor = [UIColor whiteColor];
    confirmPswd.keyboardType = UIKeyboardTypeASCIICapable;
    confirmPswd.layer.cornerRadius = 2.5;
    [confirmPswd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.top.mas_equalTo(pswd.mas_bottom);
        make.left.mas_equalTo(outline);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *registerBtn = [UIButton new];
    registerBtn.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:16];
    registerBtn.layer.cornerRadius = 2.5;
    if (_isZhuce == YES) {
        [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    }else if (_isZhuce == NO){
        [registerBtn setTitle:@"修改完成" forState:UIControlStateNormal];
    }
    registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registerBtn.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:0.0/255.0 alpha:1.0f];
    [registerBtn addTarget:self action:@selector(register:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(outline);
        make.left.mas_equalTo(outline);
        make.top.mas_equalTo(outline.mas_bottom).offset(10);
        make.height.mas_equalTo(38);
    }];
    if (_isZhuce == YES) {
    UILabel *note = [UILabel new];
    note.text = @"注册即视为同意《相关服务条款》";
    note.textColor = [UIColor whiteColor];
    note.font = [UIFont fontWithName:@"PingFang SC" size:11];
    [self.view addSubview:note];
    [note mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(outline);
        make.top.mas_equalTo(registerBtn.mas_bottom).offset(8);
    }];
    }
    
    UIView *line3 = [UIView new];
    line3.backgroundColor = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0f];
    [self.view addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(registerBtn.mas_bottom).offset(48);
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
        make.centerY.mas_equalTo(line3);
    }];
    
    UIView *line4 = [UIView new];
    line4.backgroundColor = line3.backgroundColor;
    [self.view addSubview:line4];
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(line3);
        make.right.mas_equalTo(-32);
        make.width.mas_equalTo(line3);
    }];
    
    UIButton *weibo = [UIButton new];
    [weibo setImage:[UIImage imageNamed:@"wb"] forState:UIControlStateNormal];
    [weibo addTarget:self action:@selector(weiboLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weibo];
    [weibo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(line3.mas_bottom).offset(24);
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

-(void)register:(UIButton *)sender{
    
}

-(void)sendVerfyCode:(UIButton *)sender{
    
}
-(void)weiboLogin:(UIButton *)sender{
    
}
-(void)weixinLogin:(UIButton *)sender{
    
}
-(void)qqLogin:(UIButton *)sender{
    
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
