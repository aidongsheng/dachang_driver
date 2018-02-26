//
//  UILabel+Category.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/17.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)


- (void)sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.text = text;
    [self sizeToFit];
    
    if (configBlock) {
        
        configBlock(self);
    }
}

- (void)sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.attributedText = text;
    [self sizeToFit];
    
    if (configBlock) {
        
        configBlock(self);
    }
}





@end
