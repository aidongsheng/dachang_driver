//
//  UIImage+Compression.h
//  51carlife
//
//  Created by lijun mou on 2018/1/26.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)

- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength;
-(NSData *)compressBySizeWithMaxLength:(NSUInteger)maxLength;

@end
