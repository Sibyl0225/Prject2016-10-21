//
//  TextViewAutoFitsCell.m
//  TextViewAutoFits
//
//  Created by MAC on 8/10/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import "TextViewAutoFitsCell.h"
#import "UIView+fram.h"
#import "UIView+Additions.h"

#define kTextViewPlaceHolder @"请输入"


#define kSWidth  [UIScreen mainScreen].bounds.size.width
#define kSHeight [UIScreen mainScreen].bounds.size.height

@interface TextViewAutoFitsCell ()<UITextViewDelegate>


@end

@implementation TextViewAutoFitsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
        self.setUpBackGroundColor([UIColor whiteColor]);
    }
    return self;
}

- (void)initSubViews{
    
    UITextView *textView = [[UITextView alloc]init];
    textView.setUpViewSize(kSWidth - 4 ,35);
    textView.setUpViewTop(10).setUpViewLeft(2);
    textView.delegate = self;
    textView.scrollEnabled = NO;
    textView.setUpBackGroundColor([UIColor whiteColor]);
    textView.font = [UIFont systemFontOfSize:12];
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [UIColor redColor].CGColor;
    [self addSubview:textView];
    self.cellTextView = textView;
    
}

//- (void)setCellTextView:(UITextView *)cellTextView{
//    _cellTextView.text = cellTextView.text;
//    [self layoutIfNeeded];
//}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    // make sure the cell is at the top
    [self.textAutoFitsTableView scrollToRowAtIndexPath:[self.textAutoFitsTableView indexPathForCell:self]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:YES];
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:kTextViewPlaceHolder]) {
        textView.text = @"";
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = kTextViewPlaceHolder;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    
    if ([self.textAutoFitsTableView.delegate conformsToProtocol:@protocol(TextViewAutoFitsCellDelegate)]) {
        
        id<TextViewAutoFitsCellDelegate> delegate = (id<TextViewAutoFitsCellDelegate>)self.textAutoFitsTableView.delegate;
        NSIndexPath *indexPath = [self.textAutoFitsTableView indexPathForCell:self];
        
        // update the text
        NSString *string = textView.text;
        
        [delegate tableView:self.textAutoFitsTableView
                updatedText:string
                atIndexPath:indexPath];
        CGFloat oldHeight = [delegate tableView:self.textAutoFitsTableView heightForRowAtIndexPath:indexPath];
        NSLog(@"oldHeight : %f",oldHeight);
       CGSize size = [self.cellTextView sizeThatFits:CGSizeMake(kSWidth - 4, 0)];
        NSLog(@"newHeight : %f",size.height);
        
        if (size.height > oldHeight) {
//            NSLog(@"size.width : %f ,size.height : %f",size.width ,size.height);
            // update the height
            if ([delegate respondsToSelector:@selector(tableView:updatedHeight:atIndexPath:)]) {
                [delegate tableView:self.textAutoFitsTableView
                      updatedHeight:size.height
                        atIndexPath:indexPath];
            }
            // refresh the table without closing the keyboard
            [self.textAutoFitsTableView beginUpdates];
            [self.textAutoFitsTableView endUpdates];
        }
    }
    
}

- (void)sizeAutoToFits:(UITextView *)textView withNSLog:(BOOL) isNSLog{
    
    CGSize size = [textView sizeThatFits:CGSizeMake(kSWidth - 4, 0)];
    if (isNSLog)  NSLog(@"size.width : %f ,size.height : %f",size.width ,size.height);
    if (fabs(size.height - self.cellTextView.height) > 0.01) self.cellTextView.height = size.height;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sizeAutoToFits:self.cellTextView withNSLog:YES];
}

@end


@implementation UITableView (ACEExpandableTextCell)

- (TextViewAutoFitsCell *)expandableTextCellWithId:(NSString *)cellId
{
    TextViewAutoFitsCell *cell = [self dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TextViewAutoFitsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textAutoFitsTableView = self;
    }
    return cell;
}

@end
