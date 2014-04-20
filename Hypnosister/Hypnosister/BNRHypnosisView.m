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
    
    // 将绘图的线条颜色改为 light gray
    [[UIColor lightGrayColor] setStroke];
    
    // 绘制图形！
    [path stroke];
    
    // 清除 path 上面的所有点
    [path removeAllPoints];
    
    // 画一个三角形的路径
    [path moveToPoint:CGPointMake(60,450)];
    [path addLineToPoint:CGPointMake(260, 450)];
    [path addLineToPoint:CGPointMake(160, 120)];
    
    // 对 path 进行裁剪，接下来的绘图操作都会限定在 path 所指定的区域内
    [path addClip];
    
    
    // 配置 Gradient（渐变）
    
    // 起始点和终点，类似PS
    CGFloat locations[2]  = {0.0, 1.0};
    
    // 配置每个点的颜色
    CGFloat components[8] = {1.0,1.0,0.0,1.0,0.0,1.0,0.0,1.0};
    
    // 选择颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 创建 Gradient
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(160, 450);
    CGPoint endPoint = CGPointMake(160, 120);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint,   kCGGradientDrawsBeforeStartLocation |kCGGradientDrawsAfterEndLocation);
    
    // 恢复 CGContext
    CGContextRestoreGState(currentContext);
    
    // 设置阴影
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    // 将PNG图片绘制到屏幕上
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGSize size = logoImage.size;
    
    CGRect logoRect = CGRectMake(65, 143, size.width/2,size.height/2);
    [logoImage drawInRect:logoRect];
}


@end
