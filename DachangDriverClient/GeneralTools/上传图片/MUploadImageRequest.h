//
//  MUploadImageRequest.h
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/11.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface MUploadImageRequest : YTKRequest{
    UIImage * _image;
}
- (id)initWithImage:(UIImage *)image;
@end
