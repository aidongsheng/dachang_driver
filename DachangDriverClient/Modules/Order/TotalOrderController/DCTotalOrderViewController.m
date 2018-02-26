//
//  DCTotalOrderViewController.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/25.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "DCTotalOrderViewController.h"
#import "DCOrderTableViewCell.h"

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
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    MJRefreshStateHeader * header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        [self fetchOrdersWithStatus:0];
    }];
    _tableView.mj_header = header;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
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
        [self showText:[NSString stringWithFormat:@"更新了%li条救援订单",_model.total]];
        [_tableView reloadData];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _model.rescues.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCOrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderTableViewCell)];
    if (!cell) {
        cell = [[DCOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:stringFromClass(DCOrderTableViewCell)];
    }
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
