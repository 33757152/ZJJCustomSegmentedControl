//
//  ViewController.m
//  ZJJCustomSegmentedControl
//
//  Created by admin on 2020/7/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ViewController.h"
#import "XtaySegmentedControl.h"

@interface ViewController ()

/// 选择器
@property (nonatomic, strong) XtaySegmentedControl *segment;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.segment = [[XtaySegmentedControl alloc] initWithItems:@[@"A", @"B", @"C"] withColorsArray:@[[UIColor redColor], [UIColor linkColor]]];
    _segment.frame = CGRectMake(50, 100, 250, 40);
    [_segment addTarget:self action:@selector(changedSegmentValue) forControlEvents:UIControlEventValueChanged];
    [_segment customSegmentTitleFont:[UIFont systemFontOfSize:16.f] normalTitleColor:[UIColor greenColor] selectedTitleColor:[UIColor whiteColor]];
    // 默认第一个选项是选中的状态
    _segment.selectedSegmentIndex = 0;
    [self refreshSegmentIndex];
    [self.view addSubview:_segment];
}

- (void)refreshSegmentIndex {
    _segment.itemIndex = _segment.selectedSegmentIndex;
}

- (void)changedSegmentValue {
    [self refreshSegmentIndex];
    // 接下来处理点击事件
    
}

@end
