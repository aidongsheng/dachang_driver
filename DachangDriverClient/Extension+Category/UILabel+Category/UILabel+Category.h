//
//  UILabel+Category.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/17.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

- (void)sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;


@end
