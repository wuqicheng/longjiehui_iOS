//
//  UIImage+Image.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/26.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  根据颜色生成一张图片
 *  @param imageName 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


@end
