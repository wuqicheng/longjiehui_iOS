//
//  ExampleViewController.m
//  longjiehui
//
//  Created by 三牛犇科技 on 16/9/2.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import "ExampleViewController.h"
#import "UIView+frame.h"

@interface ExampleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSString *titleStr;

@end

@implementation ExampleViewController

- (instancetype)initWithIndex:(NSInteger)index title:(NSString *)title
{
    self = [super init];
    if (self) {
        _titleStr = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupUI
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.height = [UIScreen mainScreen].bounds.size.height-55-60;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: SimpleTableIdentifier];
    }
    
    UIView *head = [UIView new];
    head.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    head.backgroundColor = [UIColor whiteColor];
    [cell addSubview:head];
    
    UIView *foot = [UIView new];
    foot.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 60);
    foot.backgroundColor = [UIColor whiteColor];
    [cell addSubview:foot];
    
    cell.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0f];
    cell.textLabel.text = [_titleStr stringByAppendingString:[NSString stringWithFormat:@"-%d",(int)indexPath.row]];
    return cell;
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
