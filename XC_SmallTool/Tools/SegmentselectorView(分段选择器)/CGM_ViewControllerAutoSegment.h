//
//  CGM_ViewControllerSegment.h
//  Cgm_ScorllViewSegment
//
//  Created by admin on 16/7/30.
//  Copyright © 2016年 com.xc.zhutong. All rights reserved.
//  自适应的 分段控制器

#import <UIKit/UIKit.h>
#define BtnFont 17  //滑块字体大小


@interface CGM_ViewControllerAutoSegment : UIViewController

/**  定义ScorllCtrl的contenoffset 创建的时候偏移量   */
@property (nonatomic,assign)NSInteger ScorllviewIndex;

/**  定义滑块背景色  默认绿 */
@property (nonatomic,copy)UIColor *sliderBackColor;

/**  定义标题栏背景色   */
@property (nonatomic,copy)UIColor *titleScrollviewBackColor;

/**   btn。即标签 未选中正常颜色  */
@property (nonatomic,copy)UIColor *btnNormolColor;

/**  btn 即标签 选中时颜色   */
@property (nonatomic,copy)UIColor *btnSlectColor;


/**
 初始化

 @param viewCtrl 务必传入装控制器的数组
 @return self
 */
-(instancetype)initWithCtrltitle:(NSArray *)viewCtrl;

@end
