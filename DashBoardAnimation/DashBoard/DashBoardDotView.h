//
//  DashBoardDotView.h
//  TaQu
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashBoardDotView : UIView

@property (nonatomic, assign) CGFloat arcAngle;
@property (nonatomic, strong) CAGradientLayer *dotView;

- (void)changeRedrawRange;

@end
