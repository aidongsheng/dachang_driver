//
//  UICollectionViewCell+RegisterCell.m
//  51carlife
//
//  Created by lijun mou on 2018/1/29.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UICollectionViewCell+RegisterCell.h"

@implementation UICollectionViewCell (RegisterCell)
+ (void)registerClassforCellToCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}
@end
