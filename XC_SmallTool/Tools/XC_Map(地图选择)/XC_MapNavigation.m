//
//  XC_MapNavigation.m
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "XC_MapNavigation.h"

#import "XC_baiduMap.h"

#import "XC_GaodeMap.h"

#import "CGM_AlertContoller.h"

@interface XC_MapNavigation()

/** 这个属性是：百度****/
@property (nonatomic,strong)XC_baiduMap *xc_baiduMap;

/** 这个属性是：高德****/
@property (nonatomic,strong)XC_GaodeMap *xc_gaodeMap ;



@end


@implementation XC_MapNavigation

#pragma mark layz

-(XC_baiduMap *)xc_baiduMap
{
    if (!_xc_baiduMap) {
        XC_baiduMap *map = [[XC_baiduMap alloc] init];
        _xc_baiduMap = map;
    }
    return _xc_baiduMap;
}

-(XC_GaodeMap *)xc_gaodeMap
{
    if (!_xc_gaodeMap) {
        XC_GaodeMap *map = [[XC_GaodeMap alloc] init];
        _xc_gaodeMap = map;
    }
    return _xc_gaodeMap ;
}



+(instancetype)XC_MapManager
{
    XC_MapNavigation *manager = [[XC_MapNavigation alloc] init];
    return manager;
}


-(void)startMapNavagtionAndIsBaidu:(XC_MapManagerSelecteEM)mapType AndstartCoord:(CLLocationCoordinate2D)stardCoord AndendCoord:(CLLocationCoordinate2D)endCoord AndendAddressName:(NSString *)purposeAddressName
{
    switch (mapType) {
        case XC_MapManagerSelecteGaodeMap:
            [self.xc_gaodeMap navigationGaodeCoord:stardCoord AndEndCoored:endCoord AndaddressName:purposeAddressName];
            break;
        case XC_MapManagerSelecteBaiduMap:
            [self.xc_baiduMap navigationBaiduCoord:stardCoord AndEndCoored:endCoord AndaddressName:purposeAddressName];
            break;
        default:
            break;
    }
}


-(void)startMapNavagtionAuotoLayotStartCoord:(CLLocationCoordinate2D)stardCoord AndendCoord:(CLLocationCoordinate2D)endCoord AndendAddressName:(NSString *)purposeAddressName
{
        
    UIAlertActionStyle baiduStyle;
    UIAlertActionStyle gaodeStyle;
    
    NSString *messge ;
    
    if([[XC_MapNavigation XC_MapManager] isSetUpBaiduMap]){
        XCLog(@"安装了百度地图");
        messge = @"检测到你的手机安装了百度地图，建议使用百度地图进行导航";
        baiduStyle = UIAlertActionStyleDestructive;
        gaodeStyle = UIAlertActionStyleDefault ;
    }else{
        XCLog(@"没有安装百度地图");
        messge = @"检测到你的手机没有安装了百度地图,选择百度地图将会进入网页，建议使用高德地图进行导航";
        baiduStyle = UIAlertActionStyleDefault;
        gaodeStyle = UIAlertActionStyleDestructive ;
    };
    
    [CGM_AlertContoller alertTitle_CustomColor:@"温馨提示" AndIndx_One:@"百度地图导航" Andindex_oneUIAlertActionStyle:baiduStyle AndIndexTwo:@"高德地图导航" Andindex_TwoUIAlertActionStyle:gaodeStyle AndCancle:@"取消" mesasge:messge preferredStyle:UIAlertControllerStyleActionSheet oneIndexHandler:^(UIAlertAction *oneIndex) {
        //百度地图
        CLLocationCoordinate2D coorStart = stardCoord;
        [[XC_MapNavigation XC_MapManager] startMapNavagtionAndIsBaidu:XC_MapManagerSelecteBaiduMap AndstartCoord:coorStart AndendCoord:endCoord AndendAddressName:purposeAddressName];
        
    } twoIndexHandler:^(UIAlertAction *twoIndex) {
        
        //  高德地图
        //起点
        CLLocationCoordinate2D coorStart = stardCoord;
        coorStart.longitude = stardCoord.longitude - 0.0065;
        coorStart.latitude = stardCoord.latitude - 0.006 ;
        
        //终点
        CLLocationCoordinate2D coorend = endCoord;
        coorend.longitude = coorend.longitude - 0.0065;
        coorend.latitude = coorend.latitude - 0.006 ;
        
        [[XC_MapNavigation XC_MapManager] startMapNavagtionAndIsBaidu:XC_MapManagerSelecteGaodeMap AndstartCoord:coorStart AndendCoord:coorend AndendAddressName:purposeAddressName];
    } cancleHandler:^(UIAlertAction *cancle) {
        
    }];

}


-(BOOL)isSetUpBaiduMap
{
  return  [self.xc_baiduMap isSetUpBaiduMap];
}

+(BOOL)isOpenPositioning
{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        XCLog(@"定位权限没打开");
        return NO ;
    }
    else{
        XCLog(@"定位权限打开");
        return YES ;
    }
}


@end
