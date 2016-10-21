//
//  SDLayoutCellTestViewController.m
//  TextViewAutoFits
//
//  Created by MAC on 17/10/16.
//  Copyright © 2016年 Mac0225. All rights reserved.
//

#import "SDLayoutCellTestViewController.h"
#import "SDLayoutCell.h"

@interface SDLayoutCellTestViewController ()<UITableViewDelegate ,UITableViewDataSource>

@end

@implementation SDLayoutCellTestViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"SDLayoutCellTestViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SDLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SDLayoutCell"];
    if (!cell) {
        cell = [[SDLayoutCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SDLayoutCell"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SDLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SDLayoutCell"];
    if (!cell) {
        cell = [[SDLayoutCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SDLayoutCell"];
    }
    return [cell autoCellHeight] + 10 ;
}


@end
