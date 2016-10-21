//
//  TextViewAutoFitsCell.h
//  TextViewAutoFits
//
//  Created by MAC on 8/10/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TextViewAutoFitsCellDelegate <UITableViewDelegate>

@required
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath;

@optional
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath;

@end

@interface TextViewAutoFitsCell : UITableViewCell

@property (nonatomic, weak) UITableView *textAutoFitsTableView;

@property (nonatomic ,strong) UITextView *cellTextView;


@end

#pragma mark -

@interface UITableView (ACEExpandableTextCell)

// return the cell with the specified ID. It takes care of the dequeue if necessary
- (TextViewAutoFitsCell *)expandableTextCellWithId:(NSString *)cellId;

@end
