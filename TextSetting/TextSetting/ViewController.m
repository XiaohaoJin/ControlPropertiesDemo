//
//  ViewController.m
//  TextSetting
//
//  Created by 金晓浩 on 16/1/21.
//  Copyright © 2016年 jxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *familyNames;
}

@property (nonatomic, strong) UITableView  *table;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    familyNames = [UIFont familyNames];    //字体簇
    [self.view addSubview:[self table]];

   }



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"字体%zi -- %@\n北京质本文化传播有限公司\nabcdefgABCDEGF\n1234567890", indexPath.row,familyNames[indexPath.row]];
    cell.textLabel.numberOfLines = 0;
//    NSLog(@"%@ --- %d",familyNames[indexPath.row],indexPath.row);
    cell.textLabel.font = [UIFont fontWithName:[NSString stringWithFormat:@"%@",familyNames[indexPath.row]] size:20];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return familyNames.count;
}

- (UITableView *)table
{
    if (!_table) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-20)];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        _table = tableView;
    }
    return _table;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
