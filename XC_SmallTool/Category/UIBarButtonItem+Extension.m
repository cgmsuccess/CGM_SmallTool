//
//  UIBarButtonItem+Extension.m
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    CGSize size = btn.currentBackgroundImage.size;
   
    CGRect rect = CGRectMake(btn.frame.origin.x, btn.frame.origin.y, size.width, size.height);
    
    btn.frame = rect;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
