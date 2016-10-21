//
//  ViewController.m
//  TextViewAutoFits
//
//  Created by MAC on 8/10/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import "ViewController.h"
#import "TextViewAutoFitsCell.h"
#import "UIView+fram.h"
#import "UIView+Additions.h"

#define kSWidth  [UIScreen mainScreen].bounds.size.width
#define kSHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate ,UITableViewDataSource,TextViewAutoFitsCellDelegate>{
    CGFloat cellHeight[5];
}

@property (nonatomic, strong) NSMutableArray *cellData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [UITableView new];
    tableView.setUpViewTop(64).setUpViewLeft(0);
    tableView.setUpViewSize(kSWidth,kSHeight - 64);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [UIView new];
    
    self.cellData = [NSMutableArray arrayWithArray:@[@"请输入", @"", @"", @"", @""]];
    
    [self.view addSubview:tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TextViewAutoFitsCell *cell = [tableView expandableTextCellWithId:@"cellId"];
    cell.cellTextView.text = [self.cellData objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MAX(40, cellHeight[indexPath.row]);
}

- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath
{
    cellHeight[indexPath.row] = height;
}

- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath
{
    [self.cellData replaceObjectAtIndex:indexPath.row withObject:text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
