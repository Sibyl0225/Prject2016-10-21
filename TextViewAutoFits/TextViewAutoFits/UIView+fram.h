//
//  UIView+fram.h
//  textView
//
//  Created by MAC on 26/7/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (fram)
/**
 *  设置fram
 */
- (UIView *(^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))setUpFram;
/**
 *  设置背景颜色
 */
- (UIView *(^)(UIColor *color))setUpBackGroundColor;
/**
 *  top
 */
- (UIView *(^)(CGFloat top))setUpViewTop;
/**
 *  bottom
 */
- (UIView *(^)(CGFloat bottom))setUpViewBottom;
/**
 *  left
 */
- (UIView *(^)(CGFloat left))setUpViewLeft;
/**
 *  right
 */
- (UIView *(^)(CGFloat right))setUpViewRight;
/**
 *  size
 */
- (UIView *(^)(CGFloat width,CGFloat height))setUpViewSize;
/**
 *  top left bottom right 父视图  方法内自行添加子视图64
 */
- (UIView *(^)(CGFloat top,CGFloat left,CGFloat bottom,CGFloat right,UIView *superView))setUpViewWithTopLeftBottomRight;

@end
