//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by FangYiXiong on 14-4-20.
//  Copyright (c) 2014年 Fang YiXiong. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()
@property (nonatomic, strong) UIColor *circleColor;  //圆圈的颜色
@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 所有的 BNRHypnosisViews 都有一个透明的背景
        self.backgroundColor = [UIColor clearColor];
        // 圆圈的颜色默认为 lightGray
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // 获得当前 CGContext
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // 记录当前 CGContext
    CGContextSaveGState(currentContext);
    
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
    
    // 将绘图的线条颜色改为 circleColor
    [self.circleColor setStroke];
    
    // 绘制图形！
    [path stroke];
}


@end
