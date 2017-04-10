//
//  CGM_shareView.h
//  QQ_ShareView
//
//  Created by apple on 17/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGM_shareView : UIView

-(instancetype)initWithTitle:(NSArray *)titleAlrr AndWithImage:(NSArray *)imageArr;

@property (nonatomic,copy)void(^selectBlock)(NSString *selectStr); //选择回调

@end
