//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by FangYiXiong on 14-4-20.
//  Copyright (c) 2014年 Fang YiXiong. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 所有的 BNRHypnosisViews 都有一个透明的背景
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // 根据 bounds，计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 计算圆的半径，使其大小能够尽可能地撑满整个视图
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // 增加一个 0 到 2*PI 的一个圆弧（就是一个圆）
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    // 配置线的宽度为 10 points.
    path.lineWidth = 10;
    
    // 将绘图的线条颜色改为 light gray
    [[UIColor lightGrayColor] setStroke];
    
    // 绘制图形！
    [path stroke];
}


@end
