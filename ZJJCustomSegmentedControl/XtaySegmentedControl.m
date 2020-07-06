//
//  XtaySegmentedControl.m
//  ZJJCustomSegmentedControl
//
//  Created by admin on 2020/7/4.
//  Copyright © 2020 admin. All rights reserved.
//

#import "XtaySegmentedControl.h"

@interface XtaySegmentedControl () {
    // 上一个选中的底部视图
    UIView *_lastSegmentView;
}

/// 选项视图数组
@property (nonatomic, copy) NSMutableArray *viewsMArray;

/// @[选中的背景颜色, 未选中的背景颜色]
@property (nonatomic, copy) NSArray <UIColor *>*colorsArray;

@end

@implementation XtaySegmentedControl

- (instancetype)initWithItems:(NSArray *)items withColorsArray:(NSArray<UIColor *> *)colorsArray {
    self = [super initWithItems:items];
    if (self) {
        self.colorsArray = colorsArray;
    }
    return self;
}

- (NSMutableArray *)viewsMArray {
    if (!_viewsMArray) {
        _viewsMArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _viewsMArray;
}

- (void)setColorsArray:(NSArray<UIColor *> *)colorsArray {
    if (colorsArray && 2 == colorsArray.count) {
        _colorsArray = colorsArray;
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UISegment")]) {
                // 未选中的背景颜色
                view.backgroundColor = _colorsArray[1];
                [self.viewsMArray addObject:view];
            }
        }
    }
}

- (void)setItemIndex:(NSInteger)itemIndex {
    _itemIndex = itemIndex;
    if (_colorsArray && 2 == _colorsArray.count) {
        if (_lastSegmentView) {
            _lastSegmentView.backgroundColor = _colorsArray[1];
        }
        UIView *selectedView = [_viewsMArray objectAtIndex:_itemIndex];
        selectedView.backgroundColor = _colorsArray[0];
        _lastSegmentView = selectedView;
    }
}

- (void)customSegmentTitleFont:(UIFont *)font normalTitleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor {
    [self setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:titleColor} forState:UIControlStateNormal];
    [self setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:selectedTitleColor} forState:UIControlStateSelected];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
