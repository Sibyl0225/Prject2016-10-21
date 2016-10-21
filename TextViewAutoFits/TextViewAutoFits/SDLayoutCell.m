//
//  SDLayoutCell.m
//  TextViewAutoFits
//
//  Created by MAC on 17/10/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import "SDLayoutCell.h"
#import "MyLayout.h"

#define kSWidth  [UIScreen mainScreen].bounds.size.width
#define kSHeight [UIScreen mainScreen].bounds.size.height

@interface SDLayoutCell ()

@property (nonatomic ,strong) MyLinearLayout *cellLayout;

@end

@implementation SDLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    MyLinearLayout *cellLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    cellLayout.wrapContentWidth = YES;
    cellLayout.wrapContentHeight = YES;
    
    
    MyRelativeLayout *rootLayout = [MyRelativeLayout new];
    rootLayout.widthDime.equalTo(@(kSWidth));
    rootLayout.wrapContentHeight = YES;
    
    MyFloatLayout *floatLayout = [MyFloatLayout floatLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    floatLayout.wrapContentHeight = YES;
    floatLayout.myWidth = kSWidth;
    [rootLayout addSubview:floatLayout];
    
    UILabel *tempView;
    
    for (int i = 0; i < 6; i++) {
        UILabel *tagLable = [[UILabel alloc] init];
        tagLable.text = @"tag";
        if (tempView != nil) {
            tagLable.topPos.equalTo(tempView.topPos).offset(10);
            tagLable.leftPos.equalTo(tempView.rightPos).offset(10);
        }else{
            tagLable.leftPos.equalTo(@10);
            tagLable.topPos.equalTo(@10);
        }
        [tagLable sizeToFit];
        
        [floatLayout addSubview:tagLable];
        
        tempView = tagLable;
    }
    
    [floatLayout layoutIfNeeded];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"img"];
    imageView.topPos.equalTo(floatLayout.bottomPos).offset(10);
    imageView.leftPos.equalTo(@15);
    imageView.widthDime.equalTo(@120);
    imageView.heightDime.equalTo(@120);
    [rootLayout addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"框架布局是一种里面的子视图停靠在父视图特定方位并且可以重叠的布局视图。框架布局里面的子视图的布局位置和添加的顺序无关，只跟父视图建立布局约束依赖关系。框架布局将垂直方向上分为上、中、下三个方位，而水平方向上则分为左、中、右三个方位，任何一个子视图都只能定位在垂直方向和水平方向上的一个方位上。";
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:12];
    title.topPos.equalTo(imageView.topPos);
    title.leftPos.equalTo(imageView.rightPos).offset(15);
    title.rightPos.equalTo(rootLayout.rightPos).offset(15);
    title.flexedHeight = YES;
    [rootLayout addSubview:title];
    
    [rootLayout layoutIfNeeded];
    
    [cellLayout addSubview:rootLayout];
    
    [cellLayout layoutIfNeeded];
    
    [self addSubview:cellLayout];
    
    self.cellLayout = cellLayout;
    
}

- (CGFloat)autoCellHeight{
    UIView *view  = self.cellLayout;
    
    NSLog(@"%lf",view.frame.size.height);
    
    return view.frame.size.height;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

@end
