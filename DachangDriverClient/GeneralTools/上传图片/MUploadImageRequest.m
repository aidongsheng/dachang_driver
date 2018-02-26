//
//  MUploadImageRequest.m
//  DachangMerchantClient
//
//  Created by lijun mou on 2018/2/11.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "MUploadImageRequest.h"

@implementation MUploadImageRequest
- (id)initWithImage:(UIImage *)image
{
    
    if (self = [super init]) {
        _image = image;
    }
    return self;
}
- (id)jsonValidator
{
    return @{
        @"msg":[NSString class],
        @"status":[NSNumber class]
    };
}
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(_image, 0.3);
        NSString *type = @"image/jpeg";
        NSDate * date = [NSDate date];
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString * dateString = [formatter stringFromDate:date];
        NSString * fileName = [NSString stringWithFormat:@"%@.jpg",dateString];
        [formData appendPartWithFileData:data name:@"img" fileName:fileName mimeType:type];
    };
}
- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary
{
    NSString * token = [NSString stringWithFormat:@"%@",[NSUserDefaults token]];
    return @{
             @"token":token,
             @"Content-Type":@"multipart/form-data"
             };
}
@end
