//
//  DCOrderInfoViewController.h
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/26.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "BaseCustomViewController.h"
@class DCOrderInfoTableViewCell;
@class DCOrderInfoPlacesCell;
@class DCOrderInfoCustomerInfoCell;
@class DCOrderInfoPicsCell;
@class OrderInfoPictureCollectionCell;
/**
 订单详情 cell 基类
 */
@interface DCOrderInfoTableViewCell : customCell
- (void)initCellWithModel:(CLRescueOrderDetailModel *)model;
@end

/**
 救援地点 cell
 */
@interface DCOrderInfoPlacesCell : DCOrderInfoTableViewCell
@end

/**
 用户信息 cell
 */
@interface DCOrderInfoCustomerInfoCell : DCOrderInfoTableViewCell
@end

/**
 图片 cell
 */
@interface DCOrderInfoPicsCell : DCOrderInfoTableViewCell
@end
/**
 现场照片（单张） collectionViewCell
 */
@interface OrderInfoPictureCollectionCell : UICollectionViewCell
- (void)initCellWithImgUrl:(NSString *)imgUrl;
@end



@interface DCOrderInfoViewController : BaseCustomViewController
@property (nonatomic,copy) NSString * order_no, * order_id;
@end
