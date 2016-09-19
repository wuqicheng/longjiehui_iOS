//
//  RCSegmentView.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/9/1.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCSegmentView : UIView <UIScrollViewDelegate>

@property (nonatomic,strong)NSArray * nameArray;
@property (nonatomic,strong)NSArray *controllers;
@property (nonatomic,strong)UIView * segmentView;
@property (nonatomic,strong)UIScrollView * segmentScrollV;
@property (nonatomic,strong)UILabel * line;
@property (nonatomic ,strong)UIButton * seleBtn;
@property (nonatomic,strong)UILabel * down;
- (instancetype)initWithFrame:(CGRect)frame  controllers:(NSArray*)controllers titleArray:(NSArray*)titleArray ParentController:(UIViewController*)parentC;

@end
