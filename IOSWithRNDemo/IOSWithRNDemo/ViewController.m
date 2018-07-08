//
//  ViewController.m
//  IOSWithRNDemo
//
//  Created by 大海 on 2018/7/8.
//  Copyright © 2018年 An. All rights reserved.
//

#import "ViewController.h"
#import "RNViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //点击进入RN界面
    UIButton *nextRNView = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 100)];
    [nextRNView setTitle:@"进入RN界面" forState:UIControlStateNormal];
    [nextRNView setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:nextRNView];
    //添加点击事件
    [nextRNView addTarget:self action:@selector(nextButtonClicked) forControlEvents:UIControlEventTouchUpInside];

}
- (void)nextButtonClicked {
    RNViewController *RNViewC = [[RNViewController alloc]init];
    [self.navigationController pushViewController:RNViewC animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
