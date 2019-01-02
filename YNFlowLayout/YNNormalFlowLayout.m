//
//  YNNormalFlowLayout.m
//
//
//  Created by liyangly on 2018/12/23.
//  Copyright © 2018 makeupopular.com. All rights reserved.
//

#import "YNNormalFlowLayout.h"

@interface YNNormalFlowLayout ()

@property (nonatomic, assign) CGSize cSize;
@property (nonatomic, assign) CGPoint offsetPoint;

@end

@implementation YNNormalFlowLayout

- (instancetype)initWithSize:(CGSize)size andOffset:(CGPoint)offsetPoint
{
    self = [super init];
    if (self) {
        self.cSize = size;
        self.offsetPoint = offsetPoint;
    }
    return self;
}

- (CGSize)collectionViewContentSize {
    return self.cSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
    for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
        if (!attributes.representedElementKind) {
            NSUInteger index = [updatedAttributes indexOfObject:attributes];
            updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
        }
    }
    
    return updatedAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    
    CGRect frame = currentItemAttributes.frame;
    frame.origin.x += self.offsetPoint.x;
    frame.origin.y += self.offsetPoint.y;
    currentItemAttributes.frame = frame;
    
    return currentItemAttributes;
}

- (CGFloat)evaluatedMinimumInteritemSpacingForSectionAtIndex:(NSInteger)sectionIndex {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        id<YNNormalCollectionViewDelegateLayout> delegate = (id<YNNormalCollectionViewDelegateLayout>)self.collectionView.delegate;
        
        return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
    } else {
        return self.minimumInteritemSpacing;
    }
}

- (CGFloat)evaluatedMinimumLineSpacingForSectionAtIndex:(NSInteger)sectionIndex {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        id<YNNormalCollectionViewDelegateLayout> delegate = (id<YNNormalCollectionViewDelegateLayout>)self.collectionView.delegate;
        
        return [delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:sectionIndex];
    } else {
        return self.minimumLineSpacing;
    }
}

- (UIEdgeInsets)evaluatedSectionInsetForItemAtIndex:(NSInteger)index
{
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        id<YNNormalCollectionViewDelegateLayout> delegate = (id<YNNormalCollectionViewDelegateLayout>)self.collectionView.delegate;
        
        return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
    } else {
        return self.sectionInset;
    }
}

@end
