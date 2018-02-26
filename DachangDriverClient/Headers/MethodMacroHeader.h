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
#endif /* MethodMacroHeader_h */
