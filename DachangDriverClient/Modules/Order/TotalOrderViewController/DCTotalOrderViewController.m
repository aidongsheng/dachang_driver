//
//  DCTotalOrderViewController.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "DCTotalOrderViewController.h"
#import "DCOrderInfoViewController.h"

@interface DCOrderTableViewCell()
@property (nonatomic,strong) QMUILabel *  workOrderLabel, * orderStatusLabel, *orderNameLabel, * memberNameLabel, * orderCreatedTimeLabel;
@property (nonatomic,strong) QMUIButton * uploadPicBtn, * checkoutOrderBtn;
@property (nonatomic,strong) UIImageView * priorityLevelView;
@property (nonatomic,strong) rescueOrderItemInfo * order_info;

@end
@implementation DCOrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self setupSubViews];
        [self configureActions];
    }
    return self;
}

- (void)setupCell
{
    [super setupCell];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addScaleToSmallAnimation:0.8 autoreverses:NO];
}

- (void)setupSubViews
{
    [super setupSubViews];
    [self.contentView addSubview:self.workOrderLabel];
    [self.contentView addSubview:self.orderStatusLabel];
    [self.contentView addSubview:self.orderNameLabel];
    [self.contentView addSubview:self.memberNameLabel];
    [self.contentView addSubview:self.orderCreatedTimeLabel];
    [self.contentView addSubview:self.priorityLevelView];
    [self.contentView addSubview:self.uploadPicBtn];
    [self.contentView addSubview:self.checkoutOrderBtn];
    
    CGFloat height = 30;
    [self.workOrderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.height.equalTo(@(height));
        make.width.mas_equalTo(self.contentView.mas_width).multipliedBy(0.7);
    }];
    [self.orderStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.height.equalTo(@(height));
        make.left.equalTo(self.workOrderLabel.mas_right);
    }];
    [self.orderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.workOrderLabel.mas_left);
        make.top.equalTo(_workOrderLabel.mas_bottom);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.7);
        make.height.equalTo(@(height));
    }];
    [self.priorityLevelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0).offset(-20);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.width.equalTo(self.contentView.mas_height).multipliedBy(0.5);
    }];
    [self.memberNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.workOrderLabel.mas_left);
        make.top.equalTo(_orderNameLabel.mas_bottom);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.7);
        make.height.equalTo(@(height));
    }];
    [self.orderCreatedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.workOrderLabel.mas_left);
        make.top.equalTo(_memberNameLabel.mas_bottom);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.7);
        make.height.equalTo(@(height));
    }];
    
    [self.uploadPicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
        make.width.equalTo(@100);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self.checkoutOrderBtn.mas_left).offset(-UIElementSpace);
    }];
    [self.checkoutOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
        make.width.equalTo(@100);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self.contentView.mas_right);
    }];
//    _checkoutOrderBtn.hidden = YES;
}
- (QMUILabel *)workOrderLabel
{
    if (_workOrderLabel == nil) {
        _workOrderLabel = [[QMUILabel alloc]init];
        _workOrderLabel.textColor = BlackColor;
        _workOrderLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    }
    return _workOrderLabel;
}
- (QMUILabel *)orderStatusLabel
{
    if (_orderStatusLabel == nil) {
        _orderStatusLabel = [[QMUILabel alloc]init];
        //        _orderStatusLabel.text = @"订单状态";
        _orderStatusLabel.textAlignment = NSTextAlignmentCenter;
        _orderStatusLabel.textColor = BlackColor;
        _orderStatusLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    }
    return _orderStatusLabel;
}
- (QMUILabel *)orderNameLabel
{
    if (_orderNameLabel == nil) {
        _orderNameLabel = [[QMUILabel alloc]init];
        //        _orderNameLabel.text = @"订单名称";
        _orderNameLabel.textColor = BlackColor;
        _orderNameLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    }
    return _orderNameLabel;
}

- (QMUILabel *)memberNameLabel
{
    if (_memberNameLabel == nil) {
        _memberNameLabel = [[QMUILabel alloc]init];
        //        _memberNameLabel.text = @"会员名称";
        _memberNameLabel.textColor = BlackColor;
        _memberNameLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    }
    return _memberNameLabel;
}
- (QMUILabel *)orderCreatedTimeLabel
{
    if (_orderCreatedTimeLabel == nil) {
        _orderCreatedTimeLabel = [[QMUILabel alloc]init];
        //        _orderCreatedTimeLabel.text = @"订单创建时间";
        _orderCreatedTimeLabel.textColor = BlackColor;
        _orderCreatedTimeLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeSmall];
    }
    return _orderCreatedTimeLabel;
}
- (UIImageView *)priorityLevelView
{
    if (_priorityLevelView == nil) {
        _priorityLevelView = [[UIImageView alloc]init];
    }
    return _priorityLevelView;
}
- (QMUIButton *)uploadPicBtn
{
    if (_uploadPicBtn == nil) {
        _uploadPicBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"上传照片"];
        _uploadPicBtn.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeMedium];
        [_uploadPicBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        _uploadPicBtn.backgroundColor = RGB(139, 195, 74, 1);
        _uploadPicBtn.layer.cornerRadius = 5;
    }
    return _uploadPicBtn;
}
- (QMUIButton *)checkoutOrderBtn
{
    if (_checkoutOrderBtn == nil) {
        _checkoutOrderBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"查看订单"];
        _checkoutOrderBtn.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeMedium];
        [_checkoutOrderBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        _checkoutOrderBtn.backgroundColor = RGB(255, 152, 0, 1);
        _checkoutOrderBtn.layer.cornerRadius = 5;
    }
    return _checkoutOrderBtn;
}

- (void)initCellWithItemInfo:(rescueOrderItemInfo *)itemInfo
{
    _workOrderLabel.text = itemInfo.order_no;
    NSInteger order_status = itemInfo.order_status;
    if (order_status == 0) {
        _orderStatusLabel.text = @"待处理";
    }else if (order_status == 1){
        _orderStatusLabel.text = @"已派单";
    }else if (order_status == 2){
        _orderStatusLabel.text = @"派单失败(超时)";
        _checkoutOrderBtn.hidden = NO;
    }else if (order_status == 3){
        _orderStatusLabel.text = @"取消订单";
    }else if (order_status == 4){
        _orderStatusLabel.text = @"派单成功";
    }else if (order_status == 5){
        _orderStatusLabel.text = @"已完成并上传照片";
    }else if (order_status == 6){
        _orderStatusLabel.text = @"司机拒单";
    }else if (order_status == 7){
        _orderStatusLabel.text = @"商家已拒绝";
    }else if (order_status == 8){
        _orderStatusLabel.text = @"重新派单";
    }else if (order_status == 9){
        _orderStatusLabel.text = @"施救中";
    }else if (order_status == 10){
        _orderStatusLabel.text = @"未上传照片";
    }else if (order_status == 11){
        _orderStatusLabel.text = @"司机取消";
    }
    
    _memberNameLabel.text = [NSString stringWithFormat:@"%@",itemInfo.name];
    _orderCreatedTimeLabel.text = [NSString stringWithFormat:@"%@",itemInfo.created_at];
    NSInteger options = itemInfo.options;
    if (options == 1) {
        _orderNameLabel.text = @"紧急送水";
    }else if (options == 2){
        _orderNameLabel.text = @"更换备胎";
    }else if (options == 3){
        _orderNameLabel.text = @"车辆搭电";
    }else if (options == 4){
        _orderNameLabel.text = @"平板拖车";
    }else if (options == 5){
        _orderNameLabel.text = @"地库牵引";
    }else if (options == 6){
        _orderNameLabel.text = @"困境救援";
    }
    
    NSInteger is_urgent = itemInfo.is_urgent;
    if (is_urgent) {
        _priorityLevelView.image = image(@"un_emergency_icon");
    }else{
        _priorityLevelView.image = image(@"emergency_icon");
    }
    NSString * wait_time = itemInfo.wait_time;
    _orderCreatedTimeLabel.text = [NSString stringWithFormat:@"%@",wait_time];
    
    _order_info = [[rescueOrderItemInfo alloc]init];
    _order_info = itemInfo;
}

- (void)configureActions
{
    [super configureActions];
    [_uploadPicBtn blockEvent:^(QMUIButton *button) {
        
    }];
    [_checkoutOrderBtn blockEvent:^(QMUIButton *button) {
        DCOrderInfoViewController * controller = [[DCOrderInfoViewController alloc]init];
        controller.order_no = _order_info.order_no;
        controller.order_id = [NSString stringWithFormat:@"%li",_order_info.order_id];
        controller.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:controller animated:YES];
    }];
}
@end

@interface DCTotalOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) RescueOrderModel * model;
@end

@implementation DCTotalOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubViews];
}

- (void)setupSubViews
{
    [super setupSubViews];
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    MJRefreshStateHeader * header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [self fetchOrdersWithStatus:0];
    }];
    _tableView.mj_header = header;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    [DCOrderTableViewCell registerToTableView:_tableView];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataSource];
}
- (void)setupDataSource
{
    [super setupDataSource];
    [self fetchOrdersWithStatus:0];
}
/**
 获取指定状态的订单列表
 
 @param status 订单状态(0:所有订单,1:待派单, 2:已派单)
 */
- (void)fetchOrdersWithStatus:(NSInteger)status
{
    CLRescueTaskListRequest * taskReq = [[CLRescueTaskListRequest alloc]initWithPage:0 pagesize:20 status:status];
    [taskReq startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
        _model = [[RescueOrderModel alloc]init];
        _model = [RescueOrderModel modelWithDictionary:info];
//        [self showText:[NSString stringWithFormat:@"%li 条救援订单",_model.rescues.count]];
        [_tableView.mj_header endRefreshing];
        [_tableView reloadData];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [_tableView.mj_header endRefreshing];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSArray * data = _model.rescues;
    return data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCOrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderTableViewCell)];
    if (!cell) {
        cell = [[DCOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:stringFromClass(DCOrderTableViewCell)];
    }
    rescueOrderItemInfo * info = [_model.rescues objectAtIndex:indexPath.section];
    [cell initCellWithItemInfo:info];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
