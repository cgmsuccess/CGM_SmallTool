//
//  UIButton+CGMCilckBtn.m
//  zhutong
//
//  Created by apple on 16/11/15.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "UIButton+CGMCilckBtn.h"

static const  void *CGMbtnKey = &CGMbtnKey;

@implementation UIButton (CGMCilckBtn)


-(void)CgmCilckBtn:(UIControlEvents)Everns AndCGMCallCback:(CGMcilckCallBack)CGMCallBack{
    objc_setAssociatedObject(self, CGMbtnKey, CGMCallBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(cilckBtn:) forControlEvents:Everns];
}

-(void)cilckBtn:(UIButton *)sender{

     CGMcilckCallBack callBack = objc_getAssociatedObject(sender, CGMbtnKey);
    if (callBack) {
        callBack(sender);
    }
}


@end
