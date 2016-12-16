//
//  DashBoardDotView.m
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import "DashBoardDotView.h"
#import "UIView+Extension.h"
#import "Constant.h"
#import "DashBoardView.h"

@implementation DashBoardDotView

- (void)dealloc {
    [_dotView removeAllAnimations];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)changeRedrawRange{
    [self setDot];
}

- (void)setDot{
    //移除
    [_dotView removeAllAnimations];
    [_dotView removeFromSuperlayer];
    
    CAGradientLayer *lineV = [CAGradientLayer layer];
    lineV.bounds = CGRectMake(0, 0, 12, self.height * 0.5 - 23);
    lineV.position = CGPointMake(self.width * 0.5, self.height * 0.5);
    lineV.anchorPoint = CGPointMake(0.5, 0.95);
    
    UIImageView *dot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dashboardDot"]];
    dot.frame = CGRectMake(0, -1, 12, 12);
    [lineV addSublayer:dot.layer];
    
    [self.layer addSublayer:lineV];
    
    lineV.transform = CATransform3DMakeRotation(2 * M_PI_4 + DashBeginAngle + (DashRotateAngle * (_arcAngle) / DashFullScore), 0, 0, 1);
    
    // 保存
    _dotView = lineV;
}

@end
