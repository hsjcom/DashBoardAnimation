//
//  DashBoardBgView.m
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import "DashBoardBgView.h"
#import "UIView+Extension.h"
#import "Constant.h"
#import "DashBoardView.h"

@implementation DashBoardBgView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat radius = self.width * 0.5, perimeter = M_PI * radius * 2 / 3.0 * 2;
    CGFloat width = perimeter / 12.0 / 5.0;
    //设置线条的宽度
    CGContextSetLineWidth(ctx, 12);
    //设置线条的起始点样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    //虚实切换 ，实线5虚线10
    CGFloat length[] = {1.5, width - 1.5};
    CGContextSetLineDash(ctx, 0, length, 2);
    //设置颜色
    [[UIColor colorWithWhite:1 alpha:0.5] set];
    //设置路径
    CGContextAddArc(ctx, self.width *0.5, self.width * 0.5, self.width * 0.45, DashBeginAngle, DashEndAngle, 0);
    //绘制
    CGContextStrokePath(ctx);
}

@end
