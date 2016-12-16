//
//  DashBoardView.h
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashBoardProgressView.h"
#import "DashBoardIndicatorView.h"
#import "DashBoardDotView.h"
#import "DashBoardBgView.h"

#define DashBeginAngle  ((-210) / 180.0 * M_PI) //((-5 * M_PI_4) + (M_PI_4 * 0.2))
#define DashEndAngle ((30) / 180.0 * M_PI)  // ((M_PI_4) - (M_PI_4 * 0.2))

#define DashRotateAngle fabs(DashBeginAngle - DashEndAngle) //总角度
#define DashFullScore 100.0 //总分 float

static float DashTimerSpeed = 0.005; //仪表盘旋转速度
static float DashTimerScope = 1; //仪表盘旋转幅度 *必须能被 DashFullScore 整除


@interface DashBoardView : UIImageView

@property (nonatomic, strong) DashBoardBgView *dashBg; // 底色进度条
@property (nonatomic, strong) DashBoardProgressView *dashProgressView; // 渐变进度条
@property (nonatomic, strong) DashBoardIndicatorView *dashIndicatorView; //进度线
@property (nonatomic, strong) DashBoardDotView *dashDotView; //进度点
@property (nonatomic, assign) NSInteger value;

- (void)showAnimation;

//重置
- (void)resetDashBoard;

@end
