//
//  Define.h
//  longjiehui
//
//  Created by 三牛犇科技 on 16/8/20.
//  Copyright © 2016年 sanniuben. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

//#define NavBarColor [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1.0f]

#define kString(_key) NSLocalizedString(_key, @"")


 CG_INLINE UIColor *GetColorWithRGB(float r,float g,float b) {
    return [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1.0];
}

//网络
#define __SERVICE_BASE_URL    [NSString stringWithFormat:@"http://%@:%@%@%@",kServerIP,kServerPort,kBasePath,kIndex]


#endif /* Define_h */
