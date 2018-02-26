//
//  ExtensionHeader.h
//  51carlife
//
//  Created by lijun mou on 2017/12/26.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#ifndef ExtensionHeader_h
#define ExtensionHeader_h

//  NSData
#import "NSData+ConvertToString.h"
//  UITableViewCell分类
#import "UITableViewCell+Category.h"
//  UITableViewHeaderFooterView 分类
#import "UITableViewHeaderFooterView+Category.h"
//  订单列表模型
//  布局框架
#import <Masonry.h>
//  网络框架
#import <AFNetworking.h>

#import <CommonCrypto/CommonDigest.h>

#import "NSString+CLCategory.h"

#import "NSUserDefaults+CLCategory.h"

#import "UILabel+Category.h"
#import "UILabel+UnderlinePattern.h"
#import "NSDictionary+CLCategory.h"

#import "UIFont+Fonts.h"

#import "UIImage+ImageEffects.h"
#import "UIImage+Compression.h"
#import "UIImageView+TintColor.h"
#import <UIImageView+WebCache.h>
//#import "UIImageView+RemoveImage.h"

#import "UITableView+SearchBarCategory.h"

#import "UIView+ToastView.h"
#import "UIView+CLEvent.h"
#import "UIView+CLAddBaseLine.h"
#import "UIView+AnimationPracticalMethod.h"
#import "UIView+AnimationProperty.h"
#import "UIView+ConvenientMethod.h"
#import "UIView+ConvertRect.h"
#import "UIView+DebugFrame.h"
#import "UIView+GlowView.h"
#import "UIView+ScreensShot.h"
#import "UIView+SetRect.h"
#import "UIView+Shake.h"
#import "UIView+UserInteraction.h"
#import "UIView+SetupSubViews.h"
#import "UIView+ConfigureActions.h"
#import "UIView+ReturnController.h"
#import "UIView+POPAnimations.h"
#import "UIViewController+CLCategory.h"

#import "UITextField+CLCategory.h"
#import "CAShapeLayer+Category.h"

#import "BaseCustomButton.h"
#import "BaseCustomButton+POPAnimation.h"
#import "BaseCustomButton+Events.h"
#import "BaseCustomButton+LayoutTitleLabelImageView.h"

//  collectionview
#import "UICollectionViewCell+RegisterCell.h"

// 地图相关
#import "BMKLocationTool.h"
#import "BMKMapView+CLCategory.h"
#import "BMKPOITool.h"
// 网络相关
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
//// 用户信息及登录网络接口
//#import "CLLoginRequest.h"

// 音频相关
#import <AudioToolbox/AudioToolbox.h>
#import "AudioTool.h"

// QMUI 库
#import <QMUIKit/QMUIKit.h>
#import "QMUIButton+CountDown.h"
#import "QMUITextField+Warning.h"
#import "QMUIButton+Event.h"


//  textview
#import "UITextView+Placeholder.h"

//  键盘附属视图
#import "CLInputAccessoryView.h"

// tableView 刷新控件
#import <MJRefresh/MJRefresh.h>

// 数据库相关
#import "DBTool.h"
//  UITaleviewCell子类
#import "customCell.h"

//  YYKit
#import <YYKit.h>

//  多线程管理头文件

//  猿题库网络组件
#import <YTKNetwork.h>
////  极光推送
//#import <JPush/JPUSHService.h>

//  猿题库网络请求分类
#import "YTKRequest+Category.h"
//  百度地图相关
#import <BMKLocationKit/BMKLocationComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

// 救援model
#import "RescueModel.h"
//
//  上传图片接口
#import "MUploadImageRequest.h"
//
////  用户资料model
//#import "CLUserInfoModel.h"
////  司机列表模型
//#import "MDriverModel.h"
//
// 继承自 BMKMapView 的地图子类
#import "CLMapView.h"
//  登录类
#import "CLLoginViewController.h"

#endif /* ExtensionHeader_h */
