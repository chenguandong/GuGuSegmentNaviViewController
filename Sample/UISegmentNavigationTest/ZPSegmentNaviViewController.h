//
//  GuGuSegmentNaviViewController.h
//
//  Created by gugupluto on 14-2-21.
//  http://www.cnblogs.com/gugupluto/
//  Copyright (c) 2014年 gugupluto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPSegmentBarView.h"

@interface ZPSegmentNaviViewController : UIViewController<GuGuIndexDelegate>

/*!
 *  初始化
 *
 *  @param titleArray  标题
 *  @param controllers controllers
 *  @param simpleColor title默认颜色
 *  @param selectColor title选中颜色
 *  @param lineColor   底部横线颜色
 *
 *  @return 初始化
 */
-(id)initWithItems:(NSArray*)titleArray
    andControllers:(NSArray*)controllers
   simpleTextColor:(UIColor*)simpleColor
   selectTextColor:(UIColor*)selectColor
         lineColor:(UIColor*)lineColor
      backgroundColor:(UIColor*)backgroundColor
;
@end
