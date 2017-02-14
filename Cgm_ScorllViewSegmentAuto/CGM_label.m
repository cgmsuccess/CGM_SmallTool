//
//  CGM_label.m
//  CGM_ sliderCtrlView
//
//  Created by admin on 16/7/28.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import "CGM_label.h"
#define MRRed 0.4
#define MRGreen 0.6
#define MRBlue 0.7


@implementation CGM_label


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.font = [UIFont systemFontOfSize:14];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.textAlignment = NSTextAlignmentCenter;
        
        self.userInteractionEnabled = YES;
        
        self.textColor = [UIColor colorWithRed:MRRed green:MRGreen blue:MRBlue alpha:1.0];
        
    }
    return self;
}

/**
 *  设计lable的颜色渐变和大小缩放
 */
- (void)setScale:(CGFloat)scale {
    
    _scale = scale;
    
    // 默认: 0.4 0.6 0.7
    // 红色: 1.0  0   0
    
    // 颜色渐变
    CGFloat red = MRRed + (1 - MRRed) * scale;
    CGFloat green = MRGreen + (0 - MRGreen) * scale;
    CGFloat blue = MRBlue + (0 - MRBlue) * scale;
    
    self.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    // 大小缩放比例
    CGFloat transformScale = 1 + (scale * 0.3);
    self.transform = CGAffineTransformMakeScale(transformScale, transformScale);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
