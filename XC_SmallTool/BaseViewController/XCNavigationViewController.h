//
//  XCNavigationViewController.h
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/12.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCNavigationViewController : UINavigationController

/**          ****/
@property (nonatomic,copy)void(^backBlock)(void);

@end
