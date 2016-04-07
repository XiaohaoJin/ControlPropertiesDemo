//
//  ViewController.m
//  AboutNSArray
//
//  Created by 金晓浩 on 16/4/7.
//  Copyright © 2016年 jinxiaohao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 去掉数组中重复的元素
        [self arraySortOut];
}


#pragma mark -  去掉数组中重复的元素
- (void)arraySortOut{
    NSArray *array = @[@"12-11", @"12-11", @"12-11", @"12-12", @"12-13", @"12-14"];
    
#if 0
#pragma mark - 1   新数组 有顺序
    // 开辟新的内存空间
    NSMutableArray *resultArr = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSString *item in array) {
        // 判断是否存在,若不存在则添加到数组中
        if (![resultArr containsObject:item]) {
            [resultArr addObject:item];
        }
    }
    NSLog(@"resultArr == %@",resultArr);
#endif
    
#if 0
#pragma mark - 2   新数组 无顺序
    NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] initWithCapacity:array.count];
    // 字典在设置key - value时，若已存在则更新值，若不存在则插入值
    for (NSString *item in array) {
        [resultDict setObject:item forKey:item];
    }
    NSArray *resultArr = resultDict.allValues;
    NSLog(@"resultArray == %@",resultArr);
#endif
    
#if 0
#pragma mark - 3   新数组 无顺序
    // NSSet的特性（确定性、无序性、互异性），放入集合自动去重
    NSSet *set = [NSSet setWithArray:array];
    NSArray *resultArr = [set allObjects];
    NSLog(@"resultArr == %@",resultArr);
#endif
    
#pragma mark - 4   有序集合
    NSOrderedSet * set = [NSOrderedSet orderedSetWithArray:array];
    NSLog(@"%@",set.array);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
