//
//  RescueModel.h
//  DachangMerchantClient
//
//  Created by aidongsheng on 2017/10/30.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class rescueOrderItemInfo;
@interface RescueOrderModel : NSObject<YYModel>
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,strong) NSArray * rescues;
@end

@interface rescueOrderItemInfo : NSObject
@property (nonatomic,copy)  NSString * order_no;            //工单号
@property (nonatomic,assign) NSInteger order_id;            //订单id
@property (nonatomic,copy) NSString * created_at;           //工单日期
@property (nonatomic,copy) NSString * car_number_plates;    //车牌号
@property (nonatomic,copy) NSString * options_msg;          //救援项目描述
@property (nonatomic,copy) NSString * detail;               //内容
@property (nonatomic,copy) NSString * name;                 //客户名称
@property (nonatomic,copy) NSString * phone;                //联系电话
@property (nonatomic,copy) NSString * rescue_start;         //事故地点
@property (nonatomic,copy) NSString * order_msg;            //订单状态描述
@property (nonatomic,copy) NSString * wait_time;            //等待时间
@property (nonatomic,assign) NSInteger options;             //救援项目
@property (nonatomic,assign) NSInteger is_urgent;           //优先级0：不紧急，1：紧急
@property (nonatomic,assign) NSInteger rescue_mileage;      //距离
@property (nonatomic,assign) NSInteger order_status;        //商家救援状态，0：待处理，1：已派单，2派单失败(超时)，3取消订单 4派单成功 5已完成并上传照片 6：司机拒单，7商家已拒绝8重新派单 9：施救中10未上传照片11司机取消；司机救援状态：0：未接受，1：已接受，2：已拒绝，3:已完成并上传照片,4：取消订单，5：施救中，6未上传照片 7重新派单8派单失败(超时)9司机取消
@end



/**
 救援列表接口
 */
@interface CLRescueTaskListRequest : YTKRequest{
    NSInteger _page;
    NSInteger _pagesize;
    NSInteger _status;
}
- (id)initWithPage:(NSInteger)page pagesize:(NSInteger)pagesize status:(NSInteger)status;
@end


/**
 派单工单详情数据模型
 */
@interface CLRescueOrderDetailModel : NSObject
@property (nonatomic,copy) NSString * order_no;
@property (nonatomic,copy) NSString * created_at;
@property (nonatomic,copy) NSString * car_number_plates;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * phone;
@property (nonatomic,copy) NSString * rescue_start;
@property (nonatomic,copy) NSString * rescue_dest;
@property (nonatomic,copy) NSString * gps_x;
@property (nonatomic,copy) NSString * gps_y;
@property (nonatomic,copy) NSString * order_start;
@property (nonatomic,copy) NSString * shop_name;
@property (nonatomic,copy) NSString * remark;
@property (nonatomic,copy) NSString * drivername;
@property (nonatomic,copy) NSString * rescue_process;
@property (nonatomic,copy) NSString * license_plate_phone;
@property (nonatomic,copy) NSString * platenumber_environment;
@property (nonatomic,copy) NSString * destination;
@property (nonatomic,copy) NSString * car_check_list;
@property (nonatomic,copy) NSString * frame_number;
@property (nonatomic,copy) NSString * complete_photo;
@property (nonatomic,copy) NSString * leftframe_wheel;
@property (nonatomic,copy) NSString * rightframe_wheel;
@property (nonatomic,copy) NSString * options;
@property (nonatomic,copy) NSString * options_status;
@property (nonatomic,copy) NSString * dispatcher_name;
@property (nonatomic,copy) NSString * assess_content;
@property (nonatomic,copy) NSString * dispatch_time;
@property (nonatomic,copy) NSString * order_time;
@property (nonatomic,copy) NSString * complete_time;
@property (nonatomic,strong) NSArray * rescue_place_img;
@property (nonatomic,assign) NSInteger money;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,assign) NSInteger is_urgent;
@property (nonatomic,assign) NSInteger rescue_mileage;
@property (nonatomic,assign) NSInteger assess_scores;
//@property (nonatomic,copy)  NSString * reason;
@end

/**
 派单工单详情接口
 */
@interface CLRescueOrderDetailRequest : YTKRequest{
    NSString * _order_no;
    NSString * _order_id;
}
- (id)initWithOrder_no:(NSString *)order_no order_id:(NSString *)order_id;
@end

/**
 选择司机接口
 */
@interface CLRescueSelectDriverRequest : YTKRequest{
    NSInteger _page;
    NSInteger _pagesize;
}
- (id)initWithPage:(NSInteger)page pagesize:(NSInteger)pagesize;
@end

/**
 商家派单接口
 */
@interface CLRescueDispatchOrderRequest : YTKRequest{
    NSString * _order_no;
    NSInteger  _driver_id;
}
- (id)initWithDriver_id:(NSInteger)driver_id order_no:(NSString *)order_no;
@end

/**
 工单处理接口
 */
@interface CLWorkOrderProcessRequest : YTKRequest{
    NSInteger _order_no;    //工单号
    NSInteger _status;      //状态 1接受2拒绝
    NSString * _reason;     //拒绝原因
    NSString * _order_start;//接单地点状态 1必须
    double   _order_gps_x;   //接单地点GPS坐标X 纬度 状态 1必须
    double   _order_gps_y;   //接单地点GPS坐标Y 经度 状态 1必须
}
- (id)initWithOrderno:(NSInteger)order_no status:(NSInteger)status reason:(NSString *)reason order_start:(NSString *)order_start latitude:(double)order_gps_x longitude:(double)order_gps_y;
@end
