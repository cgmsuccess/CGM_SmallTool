//
//  XC_baiduMap.h
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface XC_baiduMap : NSObject

/**
 输入起点位置经纬度 和 结束位置的经纬度 导航

 @param currentCoord 自己的位置起点位置
 @param endCoord     结束位置
 @param addressName  目的地的名称
 */
-(void)navigationBaiduCoord:(CLLocationCoordinate2D)currentCoord AndEndCoored:(CLLocationCoordinate2D)endCoord AndaddressName:(NSString *)addressName;
/**  是否安装了百度地图   */
-(BOOL)isSetUpBaiduMap;


@end
