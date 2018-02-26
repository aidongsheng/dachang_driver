//
//  MethodMacroHeader.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/14.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef MethodMacroHeader_h
#define MethodMacroHeader_h

#define url(string)                              [NSURL URLWithString:string]
#define image(imageName)                         [UIImage imageNamed:(imageName)]
#define stringFromClass(className)               NSStringFromClass([className class])
#define cl_indexpath(row,section)               [NSIndexPath indexPathForRow:(row) inSection:(section)]

#define Ultralight(size)                        [UIFont PingFangSCUltralightFontSize:(size)]
#define Thin(size)                              [UIFont PingFangSCThinFontSize:(size)]
#define Light(size)                             [UIFont PingFangSCLightFontSize:(size)]
#define Regular(size)                           [UIFont PingFangSCRegularFontSize:(size)]
#define Medium(size)                            [UIFont PingFangSCMediumFontSize:(size)]
#define Semibold(size)                          [UIFont PingFangSCSemiboldFontSize:(size)]
#endif /* MethodMacroHeader_h */
