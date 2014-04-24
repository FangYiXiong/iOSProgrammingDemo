//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Yixiong on 14-4-24.
//  Copyright (c) 2014年 Fang Yixiong. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"催眠术";
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = image;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"%s got called.",__PRETTY_FUNCTION__);
}

// 手动加载 View 要覆盖这个方法.
- (void)loadView{
    // 创建一个 HypnosisView
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // 将其赋值给 ViewController 的 view 属性
    self.view = backgroundView;
    
    // 创建一个UISegmentedControl.
    UISegmentedControl * seg = [[UISegmentedControl alloc] initWithItems:@[@"Red",@"Green",@"Blue"]];
    [seg addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    seg.frame = CGRectMake(40, 40, 160, 20);
    [self.view addSubview:seg];
}

- (void)changeColor:(id)sender{
    BNRHypnosisView * view = (BNRHypnosisView *)self.view;
    NSArray *colors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
    UISegmentedControl * seg = (UISegmentedControl *)sender;
    [view setCircleColor:colors[seg.selectedSegmentIndex]];
}
@end
