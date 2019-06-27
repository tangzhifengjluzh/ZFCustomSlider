//
//  ZFCustomSlider.m
//  ZFCustomSlider
//
//  Created by LOBOT on 2019/5/9.
//  Copyright © 2019年 LOBOT. All rights reserved.
//

#import "ZFCustomSlider.h"
#define kSliderHeight 12 //slider高
@implementation ZFCustomSlider
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
        self.minimumTrackTintColor =  [UIColor colorWithRed:0.0 green:0.647 blue:0.878 alpha:1.0];
        self.maximumTrackTintColor = [UIColor lightGrayColor];
        self.value = 0.5;
        [self setThumbImage:[UIImage imageNamed:@"thumb_pressed_big"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)sliderChange:(ZFCustomSlider*)slider
{
    if (self.block) {
        self.block(slider.value);
    }
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    return true;
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];
    [self setValue:0.5 animated:YES];//回中
}

- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, (bounds.size.height - kSliderHeight) / 2.0, bounds.size.width, kSliderHeight);
}

@end
