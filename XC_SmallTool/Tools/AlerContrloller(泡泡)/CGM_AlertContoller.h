//
//  CGM_AlertContoller.h
//  zhutong
//
//  Created by apple on 17/2/28.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CGM_AlertContoller : NSObject


/**
    不带取消按钮的封装

 @param message             消息提醒
 @param confirmActionHandle 点击确定按钮的回调

 @return 返回 UIAlertAction
 */
+(UIAlertController *)alertMesasge:(NSString *)message  confirmHandler:(void(^)(UIAlertAction *No_cancal))confirmActionHandle;




/**
     带一个取消按钮 一个确定按钮的回调

 @param message             消息 温馨提示
 @param confirmActionHandle 确定按钮的回调
 @param cancleHandle        取消按钮的回调

 @return UIAlertController
 */
+(UIAlertController *)alertMesasgeTwoBtn:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(void(^)(UIAlertAction *No_cancal))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void(^)(UIAlertAction *cancal))cancleHandle AndcancleString:(NSString *)cancleString ;


/**
 带一个输入框和确定取消

 @param message             提示
 @param preferredStyle      风格
 @param confirmActionHandle 确定回调
 @param confirmString       确定字符串
 @param cancleHandle        取消回调
 @param cancleString        取消字符串
 @param placeholder         输入框提示

 @return UIAlertController
 */
+(UIAlertController *)alertMesasgeTextFile:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(void(^)(UIAlertAction *No_cancal))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void(^)(UIAlertAction *cancal))cancleHandle AndcancleString:(NSString *)cancleString AndTextFileplaceholder:(NSString *)placeholder;


/**
    2个 选择和一个 取消按钮

 @param title          泡泡名字
 @param oneString      第一个选择器的title
 @param twoString       第2个选择器的title
 @param message        温馨提示，title
 @param preferredStyle 是风格UIAlertControllerStyleActionSheet   UIAlertControllerStyleAlert
 @param confirmHandler 第一个选择器的回调
 @param cancleHandler  第二个选择器的回调

 @return 自定义  泡泡。  消息 带 取消
 */
+(UIAlertController *)alertTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  oneIndexHandler:(void(^)(UIAlertAction *oneIndex))onecallback twoIndexHandler:(void(^)(UIAlertAction *twoIndex))twocallBack cancleHandler:(void(^)(UIAlertAction *twoIndex))cancleBack ;


/**
 2个 选择和一个 取消按钮 有取消按钮的 可以自由定义选项的颜色
 
 @param title          泡泡名字
 @param oneString      第一个选择器的title
 @param twoString       第2个选择器的title
 @param message        温馨提示，title
 @param style_one       UIAlertActionStyle
 @param style_two       UIAlertActionStyle
 @param preferredStyle 是风格UIAlertControllerStyleActionSheet   UIAlertControllerStyleAlert
 @param confirmHandler 第一个选择器的回调
 @param cancleHandler  第二个选择器的回调
 
 @return 自定义  泡泡。  消息 带 取消
 */

+(UIAlertController *)alertTitle_CustomColor:(NSString *)title
                                 AndIndx_One:(NSString *)oneString Andindex_oneUIAlertActionStyle:(UIAlertActionStyle)style_one
                                 AndIndexTwo:(NSString *)twoString Andindex_TwoUIAlertActionStyle:(UIAlertActionStyle)style_two
                                   AndCancle:(NSString *)cancleString
                                     mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
                             oneIndexHandler:(void (^)(UIAlertAction *))onecallback
                             twoIndexHandler:(void (^)(UIAlertAction *))twocallBack
                               cancleHandler:(void (^)(UIAlertAction *))cancleBack;


/**
 3 个按钮和一个取消按钮
 
 @param title          泡泡名字
 @param oneString      第一个按钮名称title
 @param twoString      第二个按钮名称title
 @param threeString    第三个按钮名称title
 @param cancleString   取消
 @param message        温馨提示
 @param preferredStyle 是风格UIAlertControllerStyleActionSheet   UIAlertControllerStyleAlert
 @param onecallback    第一个选择器的回调
 @param twocallBack    第二个选择器的回调
 @param threecallBack  第三个选择器的回调
 @param cancleBack     取消 的 回调
 
 @return 自定义  泡泡。
 */
+(UIAlertController *)alertthreeTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString  AndIndexThree:(NSString *)threeString  AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  oneIndexHandler:(void(^)(UIAlertAction *oneIndex))onecallback twoIndexHandler:(void(^)(UIAlertAction *twoIndex))twocallBack threeIndexHandler:(void(^)(UIAlertAction *threeIndex))threecallBack cancleHandler:(void(^)(UIAlertAction *cancleIndex))cancleBack ;


/**
 r 个按钮和一个取消按钮


 @param title          泡泡名字
 @param oneString      第一个按钮名称title
 @param twoString      第二个按钮名称title
 @param threeString    第三个按钮名称title
 @param fourString     第4个按钮名称title

 @param cancleString   取消
 @param message        温馨提示
 @param preferredStyle 是风格UIAlertControllerStyleActionSheet   UIAlertControllerStyleAlert
 @param onecallback    第一个选择器的回调
 @param twocallBack    第二个选择器的回调
 @param threecallBack  第三个选择器的回调
 @param fourcallBack   第4个选择器的回调
 @param cancleBack     取消 的 回调

 @return UIAlertController
 */
+(UIAlertController *)alertfourTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString  AndIndexThree:(NSString *)threeString AndIndexFour:(NSString *)fourString AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle  oneIndexHandler:(void(^)(UIAlertAction *oneIndex))onecallback twoIndexHandler:(void(^)(UIAlertAction *twoIndex))twocallBack threeIndexHandler:(void(^)(UIAlertAction *threeIndex))threecallBack fourIndexHandler:(void(^)(UIAlertAction *threeIndex))fourcallBack cancleHandler:(void(^)(UIAlertAction *cancleIndex))cancleBack ;




/**
 带一个取消按钮 一个确定按钮的回调  主动传入弹出Aler的控制器


 @param message              消息 温馨提示
 @param preferredStyle       弹出的风格

 @param confirmActionHandle 确定按钮回调
 @param confirmString       确定按钮
 @param cancleHandle        取消按钮回调
 @param cancleString        取消按钮
 @param viewCtrl            传入的控制器

 @return  UIAlertController
 */
+(UIAlertController *)alertMesasgeTwoBtn:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle confirmHandler:(void (^)(UIAlertAction *))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void (^)(UIAlertAction *))cancleHandle AndcancleString:(NSString *)cancleString ViewContoller:(UIViewController *)viewCtrl;


@end
