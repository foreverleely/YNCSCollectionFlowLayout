//
//  YNCenterScaleFlowLayout.m
//  CenterScaleFlowlayoutDemo
//
//  Created by liyangly on 2018/11/12.
//  Copyright © 2018 liyang. All rights reserved.
//

#import "YNCenterScaleFlowLayout.h"

@implementation YNCenterScaleFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *arr = [self getCopyOfAttributes:[super layoutAttributesForElementsInRect:rect]];
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2.0f;
    // cell scale
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        CGFloat distance = fabs(attributes.center.x - centerX) * 2;
        CGFloat apartScale = distance/self.collectionView.bounds.size.width;
        // calculate scale by cos func
        CGFloat scale = fabs(cos(apartScale * M_PI/4));
        attributes.transform = CGAffineTransformMakeScale(1.0, scale);
    }
    return arr;
}

- (NSArray *)getCopyOfAttributes:(NSArray *)attributes
{
    NSMutableArray *copyArr = [NSMutableArray new];
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        [copyArr addObject:[attribute copy]];
    }
    return copyArr;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return true;
}

@end
