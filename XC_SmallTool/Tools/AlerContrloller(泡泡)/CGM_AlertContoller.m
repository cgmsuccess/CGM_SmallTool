//
//  CGM_AlertContoller.m
//  zhutong
//
//  Created by apple on 17/2/28.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "CGM_AlertContoller.h"

@implementation CGM_AlertContoller

//没有取消按钮的
+(UIAlertController *)alertMesasge:(NSString *)message  confirmHandler:(void(^)(UIAlertAction *No_cancal))confirmActionHandle
{

    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:confirmActionHandle];
    
    [alertController addAction:confirmAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}


//有取消按钮的 可以自由定义选项的颜色 
+(UIAlertController *)alertTitle_CustomColor:(NSString *)title
                     AndIndx_One:(NSString *)oneString Andindex_oneUIAlertActionStyle:(UIAlertActionStyle)style_one
                     AndIndexTwo:(NSString *)twoString Andindex_TwoUIAlertActionStyle:(UIAlertActionStyle)style_two
                    AndCancle:(NSString *)cancleString
                         mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
                 oneIndexHandler:(void (^)(UIAlertAction *))onecallback
                 twoIndexHandler:(void (^)(UIAlertAction *))twocallBack
                   cancleHandler:(void (^)(UIAlertAction *))cancleBack
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *oneIndexAction=[UIAlertAction actionWithTitle:oneString style:style_one handler:onecallback];
    
    UIAlertAction *twoIndexAction = [UIAlertAction actionWithTitle:twoString style:style_two handler:twocallBack];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleBack];
    
    [alertController addAction:oneIndexAction];
    [alertController addAction:twoIndexAction];
    [alertController addAction:cancleAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];

    });
    
    return alertController;
    
}



//有取消按钮的
+(UIAlertController *)alertTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle oneIndexHandler:(void (^)(UIAlertAction *))onecallback twoIndexHandler:(void (^)(UIAlertAction *))twocallBack cancleHandler:(void (^)(UIAlertAction *))cancleBack
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];

    UIAlertAction *oneIndexAction=[UIAlertAction actionWithTitle:oneString style:UIAlertActionStyleDestructive handler:onecallback];
    
    UIAlertAction *twoIndexAction = [UIAlertAction actionWithTitle:twoString style:UIAlertActionStyleDefault handler:twocallBack];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleBack];

    
    [alertController addAction:oneIndexAction];
    [alertController addAction:twoIndexAction];
    [alertController addAction:cancleAction];

    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

+(UIAlertController *)alertMesasgeTextFile:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle  confirmHandler:(void(^)(UIAlertAction *No_cancal))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void(^)(UIAlertAction *cancal))cancleHandle AndcancleString:(NSString *)cancleString AndTextFileplaceholder:(NSString *)placeholder{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:preferredStyle];
    
    //确定
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:confirmString style:UIAlertActionStyleDestructive handler:confirmActionHandle];
    //取消
    UIAlertAction *cancleAction=[UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleHandle];
    
    //添加输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = placeholder;
        textField.textColor = [UIColor grayColor];
        textField.secureTextEntry = YES ;
    }];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return alertController;
}


+(UIAlertController *)alertMesasgeTwoBtn:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle confirmHandler:(void (^)(UIAlertAction *))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void (^)(UIAlertAction *))cancleHandle AndcancleString:(NSString *)cancleString{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:preferredStyle];
    
    //确定
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:confirmString style:UIAlertActionStyleDestructive handler:confirmActionHandle];
    //取消
    UIAlertAction *cancleAction=[UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleHandle];

    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

+(UIAlertController *)alertfourTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString AndIndexThree:(NSString *)threeString AndIndexFour:(NSString *)fourString AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle oneIndexHandler:(void (^)(UIAlertAction *))onecallback twoIndexHandler:(void (^)(UIAlertAction *))twocallBack threeIndexHandler:(void (^)(UIAlertAction *))threecallBack fourIndexHandler:(void (^)(UIAlertAction *))fourcallBack cancleHandler:(void (^)(UIAlertAction *))cancleBack{
    
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *oneIndexAction=[UIAlertAction actionWithTitle:oneString style:UIAlertActionStyleDefault handler:onecallback];
    
    UIAlertAction *twoIndexAction = [UIAlertAction actionWithTitle:twoString style:UIAlertActionStyleDefault handler:twocallBack];
    
    UIAlertAction *threeIndexAction = [UIAlertAction actionWithTitle:threeString style:UIAlertActionStyleDefault handler:threecallBack];
    
    UIAlertAction *fourIndexAction = [UIAlertAction actionWithTitle:fourString style:UIAlertActionStyleDefault handler:fourcallBack];

    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleBack];
    
    
    [alertController addAction:oneIndexAction];
    [alertController addAction:twoIndexAction];
    [alertController addAction:threeIndexAction];
    [alertController addAction:fourIndexAction];
    [alertController addAction:cancleAction];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}

+(UIAlertController *)alertthreeTitle:(NSString *)title AndIndx_One:(NSString *)oneString AndIndexTwo:(NSString *)twoString AndIndexThree:(NSString *)threeString AndCancle:(NSString *)cancleString mesasge:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle oneIndexHandler:(void (^)(UIAlertAction *))onecallback twoIndexHandler:(void (^)(UIAlertAction *))twocallBack threeIndexHandler:(void (^)(UIAlertAction *))threecallBack cancleHandler:(void (^)(UIAlertAction *))cancleBack{
   
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *oneIndexAction=[UIAlertAction actionWithTitle:oneString style:UIAlertActionStyleDefault handler:onecallback];
    
    UIAlertAction *twoIndexAction = [UIAlertAction actionWithTitle:twoString style:UIAlertActionStyleDefault handler:twocallBack];
    
    UIAlertAction *threeIndexAction = [UIAlertAction actionWithTitle:threeString style:UIAlertActionStyleDefault handler:threecallBack];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleBack];
    
    
    [alertController addAction:oneIndexAction];
    [alertController addAction:twoIndexAction];
    [alertController addAction:threeIndexAction];
    [alertController addAction:cancleAction];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
    
}


+(UIAlertController *)alertMesasgeTwoBtn:(NSString *)message AndUIAlertControllerStyle:(UIAlertControllerStyle)preferredStyle confirmHandler:(void (^)(UIAlertAction *))confirmActionHandle AndconfirmActionString:(NSString *)confirmString cancleHandler:(void (^)(UIAlertAction *))cancleHandle AndcancleString:(NSString *)cancleString ViewContoller:(UIViewController *)viewCtrl{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:preferredStyle];
    
    //确定
    UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:confirmString style:UIAlertActionStyleDestructive handler:confirmActionHandle];
    //取消
    UIAlertAction *cancleAction=[UIAlertAction actionWithTitle:cancleString style:UIAlertActionStyleCancel handler:cancleHandle];
    
    [alertController addAction:confirmAction];
    [alertController addAction:cancleAction];
    
    [viewCtrl presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

@end
