//
//  UIView+fram.m
//  textView
//
//  Created by MAC on 26/7/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import "UIView+fram.h"
#import "Masonry.h"
#import "UIView+Additions.h"


@implementation UIView (fram)

- (UIView *(^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))setUpFram{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        weakSelf.frame = CGRectMake(x, y, w, h);
        return self;
    };
}

- (UIView *(^)(UIColor *color))setUpBackGroundColor{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(UIColor *color){
        weakSelf.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(CGFloat top,CGFloat left,CGFloat bottom,CGFloat right,UIView *superView))setUpViewWithTopLeftBottomRight{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat top,CGFloat left,CGFloat bottom,CGFloat right,UIView *superView){
        [superView addSubview:weakSelf];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(left);
            make.right.equalTo(superView).offset(right);
            make.top.equalTo(superView).offset(top);
            make.bottom.equalTo(superView).offset(bottom);
        }];
        
        return self;
    };

}

- (UIView *(^)(CGFloat top))setUpViewTop{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat top){
        weakSelf.top = top;
        return self;
    };
}

- (UIView *(^)(CGFloat bottom))setUpViewBottom{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat bottom){
        weakSelf.bottom = bottom;
        return self;
    };
}

- (UIView *(^)(CGFloat left))setUpViewLeft{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat left){
        weakSelf.left = left;
        return self;
    };
}

- (UIView *(^)(CGFloat right))setUpViewRight{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat right){
        weakSelf.right = right;
        return self;
    };
}

- (UIView *(^)(CGFloat width,CGFloat height))setUpViewSize{
    __weak typeof(self) weakSelf = self;
    return ^UIView *(CGFloat width,CGFloat height){
        weakSelf.width = width;
        weakSelf.height = height;
        return self;
    };
}

@end
