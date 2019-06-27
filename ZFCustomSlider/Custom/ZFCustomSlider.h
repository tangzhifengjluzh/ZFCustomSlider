//
//  ZFCustomSlider.h
//  ZFCustomSlider
//
//  Created by LOBOT on 2019/5/9.
//  Copyright © 2019年 LOBOT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFCustomSlider : UISlider
typedef void(^ZFCustomSliderBlock)(float value);
@property (nonatomic, copy)ZFCustomSliderBlock block ;

@end

NS_ASSUME_NONNULL_END
