//
//  CGM_ViewControllerSegment.h
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CGM_ViewControllerSegment : UIViewController

@property (nonatomic,assign)NSInteger ScorllviewIndex; //定义ScorllCtrl的contenoffset 偏移量

@property (nonatomic,copy)UIColor *sliderBackColor; //定义滑块背景色

@property (nonatomic,copy)UIColor *titleScrollviewBackColor; //定义标题栏背景色

@property (nonatomic,copy)UIColor *btnNormolColor;//btn 正常颜色

@property (nonatomic,copy)UIColor *btnSlectColor;//btn 选中时颜色

@property (nonatomic,assign)NSInteger titleHeight; //标题高度

-(instancetype)initWithCtrltitle:(NSArray *)viewCtrl;




@end
