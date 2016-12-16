//
//  ViewController.m
//  DashBoardAnimation
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "Constant.h"
#import "DashBoardView.h"

@interface ViewController ()

@property (nonatomic, strong) DashBoardView *dashBoard;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = COLOR_G1;
    
    [self constructView];
    
    self.dashBoard.value = 88;
}

- (DashBoardView *)dashBoard {
    if (!_dashBoard) {
        _dashBoard = [[DashBoardView alloc] initWithFrame:CGRectMake(0, 40, self.view.width, 325)];
        [self.view addSubview:_dashBoard];
    }
    return _dashBoard;
}

- (void)constructView {
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"CLEAR" forState:UIControlStateNormal];
    [btn1 setTitleColor:COLOR_C1 forState:UIControlStateNormal];
    btn1.frame = CGRectMake(self.view.width * 0.5 * 0.5 - 72 * 0.5, self.dashBoard.bottom + 30, 72, 36);
    [btn1 addTarget:self action:@selector(clearAction) forControlEvents:UIControlEventTouchUpInside];
    btn1.layer.borderWidth = 1;
    btn1.layer.borderColor = COLOR_C1.CGColor;
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"SHOW" forState:UIControlStateNormal];
    [btn2 setTitleColor:COLOR_C1 forState:UIControlStateNormal];
    btn2.frame = CGRectMake(self.view.width * 0.5 + self.view.width * 0.5 * 0.5 - 72 * 0.5, self.dashBoard.bottom + 30, 72, 36);
    [btn2 addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
    btn2.layer.borderWidth = 1;
    btn2.layer.borderColor = COLOR_C1.CGColor;
    [self.view addSubview:btn2];
}

- (void)clearAction {
    self.dashBoard.value = 0;
}

- (void)showAction {
    self.dashBoard.value = 88;
}


@end
