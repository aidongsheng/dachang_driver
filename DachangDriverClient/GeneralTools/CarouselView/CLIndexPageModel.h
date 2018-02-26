//
//  CLIndexPageModel.h
//  51carlife
//
//  Created by lijun mou on 2018/1/29.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLIndexPageAidsModel;
@class CLIndexPageAidItemModel;
@class CLIndexPageRequest;

@interface CLIndexPageModel : NSObject

@end

@interface CLIndexPageAidsModel : NSObject
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,strong) NSArray<CLIndexPageAidItemModel *> *ads;
@end

@interface CLIndexPageAidItemModel : NSObject
@property (nonatomic,assign) NSInteger adstype;
@property (nonatomic,assign) NSInteger aid;
@property (nonatomic,copy) NSString * linkurl;
@property (nonatomic,copy) NSString * picurl;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,assign) NSInteger item_id;
@end

@interface CLIndexPageRequest : YTKRequest

@end
