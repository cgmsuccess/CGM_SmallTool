//
//  XC_MapNavigation.h
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


typedef NS_ENUM(NSUInteger,XC_MapManagerSelecteEM){
    XC_MapManagerSelecteGaodeMap = 1,  //高德
    XC_MapManagerSelecteBaiduMap  //百度
};


@interface XC_MapNavigation : NSObject

/**  创建管理的图类   */
+(instancetype)XC_MapManager;

/**
 开始地图导航。用百度地图还是 手机自带的 高德地图
 
 @param mapType            手机自带的高德？ 还是百度
 @param stardCoord         开始经纬度
 @param endCoord           结束经纬度
 @param purposeAddressName 目的名称
 */
-(void)startMapNavagtionAndIsBaidu:(XC_MapManagerSelecteEM)mapType AndstartCoord:(CLLocationCoordinate2D)stardCoord  AndendCoord:(CLLocationCoordinate2D)endCoord AndendAddressName:(NSString *)purposeAddressName;



/**
 开始导航并弹出提示，选择高德 地图 或者百度 地图

 @param stardCoord         起点经纬度 --> 百度定位 经纬度
 @param endCoord           终点经纬度 --> 百度定位 经纬度
 @param purposeAddressName 终点位置
 */
-(void)startMapNavagtionAuotoLayotStartCoord:(CLLocationCoordinate2D)stardCoord  AndendCoord:(CLLocationCoordinate2D)endCoord AndendAddressName:(NSString *)purposeAddressName;


/**  是否安装了百度地图App   */
-(BOOL)isSetUpBaiduMap;

/**  是否打开了定位权限   */
+(BOOL)isOpenPositioning;


@end

