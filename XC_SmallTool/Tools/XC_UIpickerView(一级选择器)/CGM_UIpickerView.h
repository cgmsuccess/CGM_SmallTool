//
//  CGM_UIpickerView.h
//  zhutong
//
//  Created by apple on 17/3/7.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectBlock)(NSString *string ,NSInteger index);

@interface CGM_UIpickerView : UIView

- (instancetype)initWithDataArr:(NSArray *)arr;

@property (nonatomic,copy)selectBlock block ;

@property (nonatomic,copy)NSString *selectString; //选择的元素字符串
@property (nonatomic,assign)NSInteger index ; //选择元素的角标

/**   默认那个角标   */
-(void)setSelectIndex:(NSInteger)index;



@end
