//
//  RescueModel.m
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/30.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "RescueModel.h"


@implementation RescueOrderModel
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
             @"total":@"total",
             @"rescues":[rescueOrderItemInfo class]
             };
}

// 白名单
+ (NSArray *)modelPropertyWhitelist {
    return @[@"total",
             @"rescues"];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end

@implementation rescueOrderItemInfo

// custom
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"order_id":@"order_id",
             @"order_no":@"order_no",
             @"created_at":@"created_at",
             @"car_number_plates":@"car_number_plates",
             @"options_msg":@"options_msg",
             @"detail":@"detail",
             @"name":@"name",
             @"phone":@"phone",
             @"rescue_start":@"rescue_start",
             @"order_msg":@"order_msg",
             @"wait_time":@"wait_time",
             @"options":@"options",
             @"is_urgent":@"is_urgent",
             @"rescue_mileage":@"rescue_mileage",
             @"order_status":@"order_status"
             };
}

// 白名单
+ (NSArray *)modelPropertyWhitelist {
    return @[
             @"order_id",
             @"order_no",
             @"created_at",
             @"car_number_plates",
             @"options_msg",
             @"detail",
             @"name",
             @"phone",
             @"rescue_start",
             @"order_msg",
             @"wait_time",
             @"options",
             @"is_urgent",
             @"rescue_mileage",
             @"order_status"
             ];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end

@implementation CLRescueTaskListRequest
- (id)initWithPage:(NSInteger)page pagesize:(NSInteger)pagesize status:(NSInteger)status
{
    if (self = [super init]) {
        _page = page;
        _pagesize = pagesize;
        _status = status;
    }
    return self;
}
- (id)requestArgument
{
    
    return @{@"page":@(_page),@"pagesize":@(_pagesize),@"status":@(_status)};
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (NSString *)requestUrl
{
    return @"/api/driverorder";
}
- (NSString *)baseUrl
{
    return CLBaseUrl;
}
- (id)jsonValidator
{
    return @{
             @"total": [NSNumber class],//
             @"rescues": @[@{
                               @"order_id": [NSNumber class],//订单id
                               @"order_no": [NSString class],//工单号
                               @"created_at": [NSString class],//工单日期
                               @"car_number_plates": [NSString class],//车牌号
                               @"options_msg": [NSString class],
                               @"options": [NSNumber class],//救援项目
                               @"detail": [NSString class],//内容
                               @"name": [NSString class],//客户名称
                               @"phone": [NSString class],//联系电话
                               @"rescue_start": [NSString class],//事故地点
                               @"is_urgent": [NSNumber class],//优先级0：不紧急，1：紧急
                               @"order_msg": [NSString class],
                               @"rescue_mileage":[NSNumber class],//距离
                               @"wait_time": [NSString class],//等待时间
                               @"order_status": [NSNumber class]//商家救援状态，0：待处理，1：已派单，2派单失败(超时)，3取消订单 4派单成功 5已完成并上传照片 6：司机拒单，7商家已拒绝8重新派单 9：施救中10未上传照片11司机取消；司机救援状态：0：未接受，1：已接受，2：已拒绝，3:已完成并上传照片,4：取消订单，5：施救中，6未上传照片 7重新派单8派单失败(超时)9司机取消
                               }
                           ]
             };
}
@end

@implementation CLRescueOrderDetailModel
@end

@implementation CLRescueOrderDetailRequest

- (id)initWithOrder_no:(NSString *)order_no order_id:(NSString *)order_id
{
    if (self = [super init]) {
        _order_no = order_no;
        _order_id = order_id;
    }
    return self;
}
- (id)jsonValidator
{
    return @{
             @"status": [NSNumber class],           //1：成功；0：失败;
             @"msg": @{
                     @"order_no": [NSString class],//工单号
                     @"created_at": [NSString class],//创建时间
                     @"car_number_plates": [NSString class],//车牌号
                     @"name": [NSString class],//会员名
                     @"phone": [NSString class],//联系电话
                     @"rescue_start": [NSString class],//救援地点
                     @"rescue_dest": [NSString class],//目的地
                     @"gps_x": [NSString class],//救援地点GPS坐标X
                     @"gpx_y": [NSString class],//救援地点GPS坐标Y
                     @"order_start": [NSString class],//接单地点
                     @"shop_name": [NSString class],//分配单位
                     @"rescue_place_img": [NSArray class],//顾客上传照片 返回缩约图，对应原图去掉"thumb_"
                     @"remark": [NSString class],//备注
                     @"money": [NSNumber class],//救援费用
                     @"drivername": [NSString class],//司机名称
                     @"status": [NSNumber class],//
                     @"is_urgent": [NSNumber class],//0：不紧急，1：紧急
                     @"rescue_process": [NSString class],//施救过程
                     @"license_plate_phone": [NSString class],//救援前带牌照照片地址
                     @"platenumber_environment": [NSString class],//现场照片，看清车牌号和周边环境照片地址
                     @"destination": [NSString class],//到达拖车目的地照片地址
                     @"car_check_list": [NSString class],//车辆状况检查表照片地址
                     @"frame_number": [NSString class],//车架号照片地址
                     @"complete_photo": [NSString class],//完成装车照片地址
                     @"leftframe_wheel": [NSString class],//架小轮左轮照片地址
                     @"rightframe_wheel": [NSString class],//架小轮右轮照片地址
                     @"options": [NSString class],//救援项目,
                     @"options_status": [NSString class],//3,
                     @"dispatcher_name": [NSString class],//派单人员
                     @"rescue_mileage": [NSNumber class],//行驶距离
                     @"assess_scores": [NSNumber class],//用户评分
                     @"assess_content": [NSString class],//用户评价内容
                     @"dispatch_time": [NSString class],//派单时间，
                     @"order_time": [NSString class],//接单时间或拒单时间
                     @"complete_time": [NSString class],//完成时间
                     @"reason":[NSString class]//原因
                     }
             };
}
- (NSString *)requestUrl
{
    return @"/api/driverorder/edit";
}
- (id)requestArgument
{
    return @{@"order_no":[NSString stringWithFormat:@"%@",_order_no],@"order_id":[NSString stringWithFormat:@"%@",_order_id]};
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

@end


@implementation CLRescueSelectDriverRequest
- (id)initWithPage:(NSInteger)page pagesize:(NSInteger)pagesize
{
    if (self = [super init]) {
        _page = page;
        _pagesize = pagesize;
    }
    return self;
}
- (NSString *)requestUrl
{
    return @"/api/shoporder/drivers";
}
- (id)requestArgument
{
    return @{@"page":@(_page),@"pagesize":@(_pagesize)};
}
- (id)jsonValidator{
    return @{
             @"total": [NSNumber class],
             @"drivers": @[
                     @{
                         @"dri_id": [NSNumber class],//
                         @"name": [NSString class],//司机姓名
                         @"phone": [NSString class],//联系方式
                         @"dri_address": [NSString class],//加盟商地址
                         @"dri_status": [NSNumber class],//状态 1空闲，2工作中
                         @"dri_msg": [NSString class],//状态
                         @"distance":[NSNumber class],//距离
                         },
                     ]
             };
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
@end

@implementation CLRescueDispatchOrderRequest
- (id)initWithDriver_id:(NSInteger)driver_id order_no:(NSString *)order_no
{
    if (self = [super init]) {
        _order_no = order_no;
        _driver_id = driver_id;
    }
    return self;
}
- (NSString *)requestUrl
{
    return @"/api/shoporder/dispatch";
}
- (id)requestArgument
{
    return @{@"order_no":_order_no,@"driver_id":@(_driver_id)};
}
- (id)jsonValidator
{
    return @{
             @"status": [NSNumber class],
             @"msg":[NSString class]
             };
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
@end

@implementation CLWorkOrderProcessRequest
- (id)initWithOrderno:(NSInteger)order_no
               status:(NSInteger)status
               reason:(NSString *)reason
          order_start:(NSString *)order_start
             latitude:(double)order_gps_x
            longitude:(double)order_gps_y
{
    if (self = [super init]) {
        _order_no = order_no;
        _status = status;
        _reason = reason;
        _order_start = order_start;
        _order_gps_x = order_gps_x;
        _order_gps_y = order_gps_y;
    }
    return self;
}
- (NSString *)requestUrl
{
    return @"/api/shoporder/handleOrder";
}
- (id)requestArgument
{
    return @{@"order_no":@(_order_no),@"status":@(_status),@"reason":_reason,@"order_gps_x":@(_order_gps_x),@"order_gps_y":@(_order_gps_y),@"order_start":_order_start};
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)jsonValidator
{
    return @{
             @"status": [NSNumber class],
             @"msg":[NSString class]
             };
}

@end

@implementation CLDriverWorkOrderProcessRequest

- (id)initWithOrderNo:(NSString *)orderNo
               status:(NSInteger)status
           orderStart:(NSString *)orderStart
            orderGPSx:(double)orderGPSx
            orderGPSy:(double)orderGPSy
               reason:(NSString *)reason
{
    if (self == [super init]) {
        _order_no = orderNo;
        _status = status;
        _order_start = orderStart;
        _order_gps_x = orderGPSx;
        _order_gps_y = orderGPSy;
        _reason = reason;
    }
    return self;
}
- (NSString *)requestUrl
{
    return @"/api/driverorder/handleOrder";
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{
             @"order_no":_order_no,
             @"reason":_reason,
             @"order_gps_x":@(_order_gps_x),
             @"order_gps_y":@(_order_gps_y),
             @"status":@(_status),
             @"order_start":_order_start
             };
}
-(id)jsonValidator
{
    return @{
             @"status":[NSNumber class],
             @"msg":[NSString class]
             };
}
@end


@implementation DCFetchTakingOrderRequest
- (NSString *)requestUrl
{
    return @"/api/driverorder/dispatch_status";
}
- (id)jsonValidator
{
    return @{
             @"status":[NSNumber class],
             @"msg":[NSNumber class]
             };
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
@end

@implementation DCChangeTakingOrderStatusRequest
- (id)initWithStatus:(NSInteger)status
{
    if (self == [super init]) {
        _status = status;
    }
    return self;
}
- (NSString *)requestUrl
{
    return @"/api/driverorder/isDispatch";
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}
- (id)requestArgument
{
    return @{@"status":@(_status)};
}
@end
