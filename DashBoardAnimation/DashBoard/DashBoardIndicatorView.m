//
//  DashBoardIndicatorView.m
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import "DashBoardIndicatorView.h"
#import "UIView+Extension.h"
#import "Constant.h"
#import "DashBoardView.h"

@implementation DashBoardIndicatorView

- (void)dealloc {
    [_lineView removeAllAnimations];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)changeRedrawRange{
//    [self setLine];
}

- (void)setLine{
    //移除
    [_lineView removeAllAnimations];
    [_lineView removeFromSuperlayer];
    
    CAGradientLayer *lineV = [CAGradientLayer layer];
    lineV.bounds = CGRectMake(0, 0, 12, self.height * 0.5 - 25);
    lineV.position = CGPointMake(self.width * 0.5, self.height * 0.5);
    lineV.anchorPoint = CGPointMake(0.5, 0.95);;
    
//    UIImageView *dot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboardDot"]];
//    dot.frame = CGRectMake(0, -1, 12, 12);
//    [lineV addSublayer:dot.layer];
    
    [self.layer addSublayer:lineV];
    
    lineV.transform = CATransform3DMakeRotation(2 * M_PI_4 + DashBeginAngle + (DashRotateAngle * (_arcAngle) / DashFullScore), 0, 0, 1);
    
    // 保存
    _lineView = lineV;
}

#pragma mark - set方法赋值 重绘

- (void)setNum:(CGFloat)num {
    _num = num;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 1);
    CGFloat end = DashBeginAngle + (DashRotateAngle * (_num) / DashFullScore);
    if (_num > 0) {
        CGContextAddArc(ctx, self.width * 0.5, self.width * 0.5, (self.width - 45) * 0.45, DashBeginAngle, end, 0);
        //绘制
        CGContextStrokePath(ctx);
    }
}


@end
