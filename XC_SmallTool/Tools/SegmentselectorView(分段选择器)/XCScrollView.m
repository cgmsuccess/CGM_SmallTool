//
//  XCScrollView.m
//  zhutong
//
//  Created by apple on 17/4/26.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "XCScrollView.h"

@interface XCScrollView ()
@end

@implementation XCScrollView
/*
 UITapGestureRecognizer:用来识别点击手势,包括单击，双击，甚至三击等。
 UIPinchGestureRecognizer:用来识别手指捏合手势。
 UIPanGestureRecognizer:用来识别拖动手势。
 UISwipeGestureRecognizer:用来识别Swipe手势。
 UIRotationGestureRecognizer:用来识别旋转手势。
 UILongPressGestureRecognizer:用来识别长按手势。
 */


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return YES; //返回yes  返回上一级 控制器
    }
    return NO;
}


- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    
    UIWindow *windowView = [UIApplication sharedApplication].delegate.window; //获屏幕距离。ponit
    
    if (gestureRecognizer == self.panGestureRecognizer) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan locationInView:windowView];
        XCLog(@"poin %@" ,NSStringFromCGPoint(point)); //5s  就是 0 到 320
        
        if (point.x > 0 && point.x < 25) { // 屏幕的坐标点
            return YES ; //滑动返回上一级目录
        }
        
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            XCLog(@"locationPoint = %@" ,NSStringFromCGPoint(location)); //获取scrollview 坐标点
            if (point.x > 0 && location.x < 50 && self.contentOffset.x <= 0) {
                return YES;
                }
            }
        }
                return NO;

}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return NO;
    }
    return YES;
    
}

@end
