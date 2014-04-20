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
    
    // 计算最大圆的半径，hypot(double,double) 返回直角三角形斜边的长度
    float maxRadius = (hypot(bounds.size.width, bounds.size.height) / 2.0);

    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0 ; currentRadius -= 20) {
        // 解决麦田怪圈问题..
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        // 画一系列的同心圆
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // 配置线的宽度为 10 points.
    path.lineWidth = 10;
    
    // 将绘图的线条颜色改为 light gray
    [[UIColor lightGrayColor] setStroke];
    
    // 绘制图形！
    [path stroke];
    
    // 将PNG图片绘制到屏幕上
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGSize size = logoImage.size;
    
    CGRect logoRect = CGRectMake(65, 143, size.width/2,size.height/2);
    [logoImage drawInRect:logoRect];
}


@end
