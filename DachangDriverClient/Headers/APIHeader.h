//
//  APIHeader.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/14.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef APIHeader_h
#define APIHeader_h

#ifdef DEBUG
    // 开发服务器地址
# define CLBaseUrl @"http://106.14.205.177"
#else
    // 发布服务器地址
# define CLBaseUrl @"http://51api.dcqcjlb.com:9801"
#endif

#endif /* APIHeader_h */
