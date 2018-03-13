//
//  XC_baiduMap.m
//  zhutong
//
//  Created by apple on 17/9/16.
//  Copyright © 2017年 com.xc.zhutong. All rights reserved.
//

#import "XC_baiduMap.h"

@implementation XC_baiduMap


/**  需要集成百度地图才行   */
-(void)navigationBaiduCoord:(CLLocationCoordinate2D)currentCoord AndEndCoored:(CLLocationCoordinate2D)endCoord AndaddressName:(NSString *)addressName
{
    /*
    
    BMKOpenTransitRouteOption *opt = [[BMKOpenTransitRouteOption alloc] init];
    
    opt.appScheme = ALIPAYCALLBACK;//用于调起成功后，返回原应用
    //初始化起点节点
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
    //指定起点经纬度,自己的位置
    CLLocationCoordinate2D coor1;
    coor1 = currentCoord ;
    
    XCLog(@"%f  %f" ,coor1.latitude ,coor1.longitude);
    
    
    //指定起点名称
    start.name = @"我的位置";
    start.pt = coor1;
    //指定起点
    opt.startPoint = start;
    
    
    //初始化终点节点
    BMKPlanNode* end = [[BMKPlanNode alloc]init];
    CLLocationCoordinate2D coor2 = endCoord;

    end.pt = coor2;
    //指定终点名称
    end.name = addressName;
    opt.endPoint = end;
    
    //打开地图公交路线检索
    BMKOpenErrorCode code = [BMKOpenRoute openBaiduMapTransitRoute:opt];
    XCLog(@"调起步行导航：errorcode=%d", code);
     */
}

-(BOOL)isSetUpBaiduMap
{
    NSString *urlStr = [NSString stringWithFormat:@"baidumap://map/"];
    
    BOOL baiduMapCanOpen=[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]];
    return baiduMapCanOpen ;
}


@end
