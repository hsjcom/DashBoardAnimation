//
//  DashBoardView.m
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import "DashBoardView.h"
#import "UIView+Extension.h"
#import "Constant.h"

@interface DashBoardView ()

@property (nonatomic, strong) NSTimer *proTimer;
@property (nonatomic, strong) UILabel *numLabel;

@end




@implementation DashBoardView

- (void)dealloc {
    [self stopAnimatiom];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.superview) {
        [self stopAnimatiom];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initProgressView];
        [self initBaseView];
    }
    return self;
}

- (void)initBaseView{
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    
    [self constructView];
}

- (void)constructView {
    _numLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _numLabel.font = [UIFont systemFontOfSize:60];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    _numLabel.textColor = COLOR_C1;
    [self addSubview:_numLabel];
}

#pragma mark - Dash Board

- (void)initProgressView{
    //底色进度条
    [self addSubview:self.dashBg];
    self.dashBg.frame = CGRectMake(self.width * 0.5 - 260 * 0.5, 20, 260, 260);
    
    //渐变进度条
    self.dashProgressView.frame = CGRectMake(0, 0, self.dashBg.width, self.dashBg.height);
    [self.dashBg addSubview:self.dashProgressView];
    //渐变进度条渐变颜色设置
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.dashProgressView.frame;
    gradientLayer.startPoint = CGPointMake(0, 0.5); //CGPointMake(0, 0.5)
    gradientLayer.endPoint = CGPointMake(1, 0.5); //CGPointMake(1, 0.5)
    CGColorRef color11 = RGBCOLOR(255, 198, 0).CGColor;
    CGColorRef color22 = RGBCOLOR(255, 90, 0).CGColor;
    CGColorRef color33 = RGBCOLOR(255, 67, 85).CGColor;
    CGColorRef color44 = RGBCOLOR(56, 46, 255).CGColor;
//    gradientLayer.colors = @[(__bridge id)color11, (__bridge id)color11, (__bridge id)color22, (__bridge id)color22, (__bridge id)color33, (__bridge id)color33, (__bridge id)color44, (__bridge id)color44];
    gradientLayer.colors = @[(__bridge id)color11, (__bridge id)color22, (__bridge id)color33, (__bridge id)color44];
    gradientLayer.mask = self.dashProgressView.layer;
    [self.dashBg.layer addSublayer:gradientLayer];
    
    //进度线
    self.dashIndicatorView.frame = CGRectMake(0, 0, self.dashBg.width, self.dashBg.height);
    self.dashIndicatorView.arcAngle = 0;
    [self.dashBg addSubview:self.dashIndicatorView];
    //进度线渐变颜色设置
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.frame = self.dashIndicatorView.frame;
    gradientLayer2.startPoint = CGPointMake(0, 0.7);
    gradientLayer2.endPoint = CGPointMake(1, 0.3);
    CGColorRef color1 = RGBCOLOR(99, 93, 85).CGColor;
    CGColorRef color2 = RGBCOLOR(207, 174, 100).CGColor;
    CGColorRef color3 = RGBCOLOR(255, 209, 79).CGColor;
    gradientLayer2.colors = @[(__bridge id)color1, (__bridge id)color2, (__bridge id)color2, (__bridge id)color3];
    gradientLayer2.mask = self.dashIndicatorView.layer;
    [self.dashBg.layer addSublayer:gradientLayer2];
    
    //进度点
    self.dashDotView.frame = CGRectMake(0, 0, self.dashBg.width, self.dashBg.height);
    [self.dashBg addSubview:self.dashDotView];
    
    [self resetDashBoard];
}

- (void)setValue:(NSInteger)value {
    if (value < 0) {
        return;
    }
    
    //重置
    [self resetDashBoard];
    
    _value = value > DashFullScore ? DashFullScore : value;

    [self showAnimation];
}

- (void)changeRadarView{
    if (self.dashProgressView.num < _value) {
        
        self.dashProgressView.num += DashTimerScope;
        
        self.dashIndicatorView.arcAngle += DashTimerScope;
        self.dashIndicatorView.num += DashTimerScope;
        [self.dashIndicatorView changeRedrawRange];
        
        self.dashDotView.arcAngle += DashTimerScope;
        [self.dashDotView changeRedrawRange];
        
        [self setNumLabelText:self.dashProgressView.num];
        
    } else {
        [self stopAnimatiom];
        [self setNumLabelText:_value];
    }
}

//重置
- (void)resetDashBoard {
    _value = 0;
    self.dashProgressView.num = _value;
    
    self.dashIndicatorView.arcAngle = _value;
    self.dashIndicatorView.num = _value;
    [self.dashIndicatorView changeRedrawRange];
    
    self.dashDotView.arcAngle = _value;
    [self.dashDotView changeRedrawRange];
}

- (void)setNumLabelText:(CGFloat)num {
    if (num < 0 || num > DashFullScore) {
        return;
    }
    _numLabel.text = [NSString stringWithFormat:@"%.0f", num];
    [_numLabel sizeToFit];
    _numLabel.frame = CGRectMake(self.width * 0.5 - _numLabel.width * 0.5, self.height * 0.5 - _numLabel.height * 0.5, _numLabel.width, _numLabel.height);
}

- (void)showAnimation {
    if (!_proTimer) {
        _proTimer = [NSTimer scheduledTimerWithTimeInterval:DashTimerSpeed target:self selector:@selector(changeRadarView) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.proTimer forMode:NSRunLoopCommonModes];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.value ++;
}

- (void)stopAnimatiom {
    if (_proTimer) {
        INVALIDATE_TIMER(_proTimer);
    }
}

- (DashBoardBgView *)dashBg {
    if (!_dashBg) {
        _dashBg = [[DashBoardBgView alloc] init];
        _dashBg.backgroundColor = [UIColor clearColor];
    }
    return _dashBg;
}

- (DashBoardProgressView *)dashProgressView {
    if (!_dashProgressView) {
        _dashProgressView = [[DashBoardProgressView alloc] init];
        _dashProgressView.backgroundColor = [UIColor clearColor];
    }
    return _dashProgressView;
}

- (DashBoardIndicatorView *)dashIndicatorView {
    if (!_dashIndicatorView) {
        _dashIndicatorView = [[DashBoardIndicatorView alloc] init];
        _dashIndicatorView.backgroundColor = [UIColor clearColor];
    }
    return _dashIndicatorView;
}

- (DashBoardDotView *)dashDotView {
    if (!_dashDotView) {
        _dashDotView = [[DashBoardDotView alloc] init];
        _dashDotView.backgroundColor = [UIColor clearColor];
    }
    return _dashDotView;
}

@end
