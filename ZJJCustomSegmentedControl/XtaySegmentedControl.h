//
//  XtaySegmentedControl.h
//  ZJJCustomSegmentedControl
//
//  Created by admin on 2020/7/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XtaySegmentedControl : UISegmentedControl

/// 初始化
/// @param items 元素数组
/// @param colorsArray 颜色数组,exp: @[选中的背景颜色,未选中的背景颜色]
- (instancetype)initWithItems:(NSArray *)items withColorsArray:(NSArray<UIColor *> *)colorsArray;

/// 设置选择器字体大小颜色
/// @param font 字体大小
/// @param titleColor 未选中状态下的字体颜色
/// @param selectedTitleColor 选中状态下的字体颜色
- (void)customSegmentTitleFont:(UIFont *)font normalTitleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor;

/// 点击的索引值，即时赋值有效
@property (nonatomic, assign) NSInteger itemIndex;

@end

NS_ASSUME_NONNULL_END
