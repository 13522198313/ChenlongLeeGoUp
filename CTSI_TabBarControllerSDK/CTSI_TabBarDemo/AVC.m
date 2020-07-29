//
//  AVC.m
//  CTSI_TabBarController
//
//  Created by lcl on 2020/7/23.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "AVC.h"
#import "BVC.h"
#import "CVC.h"
#import "DVC.h"
@interface AVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tab;
@property (nonatomic, strong) NSArray *titleArr;
@end

@implementation AVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tab];
    self.titleArr = @[@"static",@"dynamic",@"camera"];
    UIView *view = [[UIView alloc] init];
    self.tab.tableFooterView = view;
    
}
#pragma mark - tableviewDelegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
      
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
- (UITableView *)tab{
    if (!_tab) {
        _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tab.delegate = self;
        _tab.dataSource = self;
        _tab.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
        _tab.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tab.showsVerticalScrollIndicator = NO;
    }
    return _tab;
}

@end
