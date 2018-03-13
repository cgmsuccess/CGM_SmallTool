//
//  XC_PhotoSelect.h
//  zhutong
//
//  Created by apple on 17/9/14.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XC_PhotoSelect : NSObject

/**
 是照相还是打开相册

 @param ctrl         传入控制器
 @param isPhotoalbum YES 是打开相册  
 */
-(void)selectPhotoviewCtrl:(UIViewController *)ctrl photographicOrPhotoalbum:(BOOL)isPhotoalbum;

/** 这个属性是：取到选择的base64 字符串回调****/
@property (nonatomic,copy)void(^photoBlock)(NSString *,UIImage *) ;


@end
