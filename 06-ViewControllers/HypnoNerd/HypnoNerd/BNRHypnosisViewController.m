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

// 手动加载 View 要覆盖这个方法.
- (void)loadView{
    // 创建一个 HypnosisView
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // 将其赋值给 ViewController 的 view 属性
    self.view = backgroundView;
}
@end
