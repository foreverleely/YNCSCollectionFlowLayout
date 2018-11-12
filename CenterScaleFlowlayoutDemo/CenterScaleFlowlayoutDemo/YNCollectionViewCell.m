//
//  YNCollectionViewCell.m
//  CenterScaleFlowlayoutDemo
//
//  Created by liyangly on 2018/11/12.
//  Copyright © 2018 liyang. All rights reserved.
//

#import "YNCollectionViewCell.h"

@interface YNCollectionViewCell()

@property (nonatomic, strong) UILabel *label;

@end

@implementation YNCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)setIndex:(NSInteger)index {
    self.label.text = @(index).stringValue;
}

- (void)configView {
    [self addSubview:self.label];
    self.label.frame = CGRectMake(10, 0, 100, 200);
    self.label.backgroundColor = [UIColor redColor];
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
