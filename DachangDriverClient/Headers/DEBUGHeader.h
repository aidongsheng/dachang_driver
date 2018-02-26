//
//  DEBUGHeader.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/14.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef DEBUGHeader_h
#define DEBUGHeader_h

    //Debug模式打印Log信息
#ifdef  DEBUG
#define debug_NSLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define debug_NSLog(format, ...)
#endif

#ifdef DEBUG
#define ZBLog(...) NSLog(@"\n%s 第%d行: \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZBLog(...)
#endif

#ifdef DEBUG
# define DLog(format, ...) NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif


#endif /* DEBUGHeader_h */
