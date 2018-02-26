//
//  CLInputAccessoryView.h
//  51carlife
//
//  Created by lijun mou on 2018/1/22.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CLInputAccessoryViewDelegate<NSObject>
- (void)submitText:(NSString *)text;
@end
@interface CLInputAccessoryView : UIView
@property (nonatomic,weak) id<CLInputAccessoryViewDelegate>delegate;
@end
