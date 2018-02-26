//
//  DCTotalOrderViewController.h
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "BaseCustomViewController.h"
@class DCOrderTableViewCell;

@interface DCOrderTableViewCell : customCell
- (void)initCellWithItemInfo:(rescueOrderItemInfo *)itemInfo;
@end

@interface DCTotalOrderViewController : BaseCustomViewController
@end
