//
//  XCBaseViewController.h
//  XC_SmallTool
//
//  Created by gao bin on 2018/3/10.
//  Copyright © 2018年 gao bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCBaseViewController : UIViewController

/**  拦击点击返回按钮事件。同下 ，请在子类控制器，重写此方法即可  */
-(void)cilckback;

/**  如果想单独实现点击更多按钮事件，请在子类控制器，重写此方法即可，拦击点击右边的按钮事件   */
-(void)cilckMore;


@end
