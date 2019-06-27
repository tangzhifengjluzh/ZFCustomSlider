//
//  ViewController.m
//  ZFCustomSlider
//
//  Created by 汤志锋 on 2019/4/29.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ZFCustomSlider.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()
@property(nonatomic,strong)ZFCustomSlider *sliderCenter;
@property (nonatomic, assign) BOOL  canChange;
@property (nonatomic, assign) NSInteger  currentAngle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _canChange = YES;
    _currentAngle = 90;
    
    [self initSlider];
}

- (void)initSlider{
    self.sliderCenter = [[ZFCustomSlider alloc] init];
    self.sliderCenter.continuous = YES;
    [self.view addSubview:self.sliderCenter ];
    
    self.sliderCenter.frame = CGRectMake(0, 0, 220, 70);
    self.sliderCenter.center = self.view.center;
    WS(weakSelf)
    self.sliderCenter.block = ^(float value) {
        if (!weakSelf.canChange) {
            return ;
        }
        NSLog(@"角度 %ld",weakSelf.currentAngle);
        weakSelf.canChange = NO;
        if (value>0.5) {//--为了延迟 使用了dispatch_after
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                weakSelf.currentAngle = weakSelf.currentAngle - 5;
                if (weakSelf.currentAngle <= 0) {
                    weakSelf.currentAngle = 0;
                }
                //             [weakSelf.centerBle sendServoRunCmd:1 andWithAngle:weakSelf.currentAngle andWith:150];//doSomething
                weakSelf.canChange = YES;
            });
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                weakSelf.currentAngle = weakSelf.currentAngle + 5;
                if (weakSelf.currentAngle >= 180) {
                    weakSelf.currentAngle = 180;
                }
                //             [weakSelf.centerBle sendServoRunCmd:1 andWithAngle:weakSelf.currentAngle andWith:150];//doSomething
                weakSelf.canChange = YES;
            });
        }
    };
}

@end
