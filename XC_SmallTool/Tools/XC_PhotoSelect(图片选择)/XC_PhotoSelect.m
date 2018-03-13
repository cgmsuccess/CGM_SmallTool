//
//  XC_PhotoSelect.m
//  zhutong
//
//  Created by apple on 17/9/14.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "XC_PhotoSelect.h"

@interface XC_PhotoSelect ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** 这个属性是：****/
@property (nonatomic,weak)UIViewController *viewCtrl ;


@end

@implementation XC_PhotoSelect

-(void)selectPhotoviewCtrl:(UIViewController *)ctrl photographicOrPhotoalbum:(BOOL)isPhotoalbum
{
    //创建图片选择器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //设置代理
    imagePicker.delegate = self;
    //允许编辑
    imagePicker.allowsEditing = YES;
    self.viewCtrl = ctrl ;
    if (!isPhotoalbum) { //照相
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){//真机打开
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
        }else{// 模拟器打开
            
            XCLog(@"模拟器打开");
            return;
        }
        
    }else{//相册
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    //弹出相册
    [ctrl presentViewController:imagePicker animated:YES completion:nil];
    ctrl.modalPresentationStyle = UIModalPresentationOverCurrentContext;
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *infoImage = info[UIImagePickerControllerEditedImage];
    
    //图片转成2进制 。压缩图片
    NSData *imageData = UIImageJPEGRepresentation(infoImage, 0.1f);
    NSString *encodedString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]; //转base64
    self.photoBlock(encodedString,infoImage) ;
    
    [self.viewCtrl dismissViewControllerAnimated:YES completion:nil];
    
}


@end
