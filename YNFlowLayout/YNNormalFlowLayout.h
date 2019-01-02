//
//  YNNormalFlowLayout.h
//
//
//  Created by liyangly on 2018/12/23.
//  Copyright © 2018 makeupopular.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YNNormalFlowLayout : UICollectionViewFlowLayout

- (instancetype)initWithSize:(CGSize)size andOffset:(CGPoint)offsetPoint;

@end

@protocol YNNormalCollectionViewDelegateLayout <UICollectionViewDelegateFlowLayout>

@end

NS_ASSUME_NONNULL_END
