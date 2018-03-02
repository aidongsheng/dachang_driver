//
//  DCOrderInfoViewController.m
//  DachangDriverClient
//
//  Created by lijun mou on 2018/2/26.
//  Copyright © 2018年 dongsheng. All rights reserved.
//

#import "DCOrderInfoViewController.h"

@interface DCOrderInfoTableViewCell()
@property (nonatomic,strong) QMUILabel * titleLabel, * accessoryLabel;
@end
@implementation DCOrderInfoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _titleLabel = [[QMUILabel alloc]qmui_initWithFont:Semibold(LabelFontSizeLarge) textColor:BlackColor];
    [self.contentView addSubview:_titleLabel];
    _accessoryLabel = [[QMUILabel alloc]qmui_initWithFont:Medium(LabelFontSizeMedium) textColor:BlackColor];
    [self.contentView addSubview:_accessoryLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0).offset(5);
        make.right.equalTo(self.contentView.mas_centerX);
        make.height.equalTo(@30);
    }];
    [_accessoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0).offset(5);
        make.right.mas_equalTo(0).offset(-5);
        make.left.equalTo(self.contentView.mas_centerX);
        make.height.equalTo(@30);
    }];
    _accessoryLabel.textAlignment = NSTextAlignmentRight;
}
@end
@interface DCOrderInfoPlacesCell()
@property (nonatomic,strong) QMUILabel * rescueStartDESCLabel, * rescueStartLabel, * rescueDestDESCLabel, * rescueDestLabel;
@property (nonatomic,strong) UIImageView * startIconView, * destIconView;
@end
@implementation DCOrderInfoPlacesCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _rescueStartDESCLabel = [[QMUILabel alloc]qmui_initWithFont:Regular(LabelFontSizeMedium)
                                                      textColor:BlackColor];
    [self.contentView addSubview:_rescueStartDESCLabel];
    _rescueStartLabel = [[QMUILabel alloc]qmui_initWithFont:Regular(LabelFontSizeMedium)
                                                  textColor:BlackColor];
    [self.contentView addSubview:_rescueStartLabel];
    _rescueDestDESCLabel = [[QMUILabel alloc]qmui_initWithFont:Regular(LabelFontSizeMedium)
                                                     textColor:BlackColor];
    [self.contentView addSubview:_rescueDestDESCLabel];
    _rescueDestLabel = [[QMUILabel alloc]qmui_initWithFont:Regular(LabelFontSizeMedium)
                                                 textColor:BlackColor];
    [self.contentView addSubview:_rescueDestLabel];
    _startIconView = [[UIImageView alloc]initWithImage:image(@"rescue_dest_icon")];
    [self.contentView addSubview:_startIconView];
    _destIconView = [[UIImageView alloc]initWithImage:image(@"rescue_dest_icon")];
    [self.contentView addSubview:_destIconView];
    [_rescueStartDESCLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    [_startIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rescueStartDESCLabel.mas_bottom);
        make.width.height.equalTo(@30);
        make.left.equalTo(self.contentView.mas_left);
    }];
    [_rescueStartLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startIconView.mas_right);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
        make.top.equalTo(self.rescueStartDESCLabel.mas_bottom);
    }];
    [_rescueDestDESCLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
        make.top.equalTo(self.rescueStartLabel.mas_bottom);
    }];
    [_destIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rescueDestDESCLabel.mas_bottom);
        make.width.height.equalTo(@30);
        make.left.equalTo(self.contentView.mas_left);
    }];
    [_rescueDestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_startIconView.mas_right);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@30);
        make.top.equalTo(self.rescueDestDESCLabel.mas_bottom);
    }];
    [_startIconView addScaleToSmallAnimation:0.5 autoreverses:NO];
    [_destIconView addScaleToSmallAnimation:0.5 autoreverses:NO];
    _rescueStartDESCLabel.text = @"顾客所在地";
    _rescueDestDESCLabel.text = @"拖车目的地";
}
- (void)initCellWithModel:(CLRescueOrderDetailModel *)model
{
    self.titleLabel.text = [NSString stringWithFormat:@"%@",model.options];
    self.accessoryLabel.text = [NSString stringWithFormat:@"距离"];
    
    _rescueStartLabel.text = [NSString stringWithFormat:@"%@",model.rescue_start];
    _rescueDestLabel.text = [NSString stringWithFormat:@"%@",model.rescue_dest];
}
@end
@interface DCOrderInfoCustomerInfoCell()
@property (nonatomic,strong) QMUILabel * phoneLabel;
@end
@implementation DCOrderInfoCustomerInfoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _phoneLabel = [[QMUILabel alloc]qmui_initWithFont:Medium(LabelFontSizeMedium)
                                            textColor:BlackColor];
    [self.contentView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.titleLabel.mas_left);
        make.height.equalTo(@30);
        make.right.equalTo(self.contentView.mas_right);
    }];
}

- (void)initCellWithModel:(CLRescueOrderDetailModel *)model
{
    self.titleLabel.text = [NSString stringWithFormat:@"用户:%@",model.name];
    
    self.accessoryLabel.text = [NSString stringWithFormat:@"车牌号:%@",model.car_number_plates];
    
    _phoneLabel.text = [NSString stringWithFormat:@"联系方式:%@",model.phone];
}
@end


@interface DCOrderInfoPicsCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) CLRescueOrderDetailModel * detailModel;
@end
@implementation DCOrderInfoPicsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews {
    [super setupSubViews];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.bottom.right.mas_equalTo(0).offset(-5);
    }];
    _collectionView.backgroundColor = WhiteColor;
    [OrderInfoPictureCollectionCell registerClassforCellToCollectionView:_collectionView];
}
- (void)initWithModel:(CLRescueOrderDetailModel *)model {
    debug_NSLog(@"model=%@",[model modelDescription]);
    _detailModel = [[CLRescueOrderDetailModel alloc]init];
    _detailModel = model;
    self.titleLabel.text = [NSString stringWithFormat:@"现场照片"];
    [_collectionView reloadData];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _detailModel.rescue_place_img.count;;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OrderInfoPictureCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:stringFromClass(OrderInfoPictureCollectionCell) forIndexPath:indexPath];
    [cell initCellWithImgUrl:@"http://img1001.pocoimg.cn/image/poco/works/03/2018/0206/19/15179174731402207_7989723.jpg" ];
    return cell;
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(Width/2.0, _collectionView.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(UIElementSpace, UIElementSpace, UIElementSpace, UIElementSpace);
}
/**
 设置collectionViewCell行间距
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return cell 的行间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return UIElementSpace;
}

/**
 设置collectionViewCell列间距
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return cell 的列间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return UIElementSpace;
}

#pragma mark ---- UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    OrderInfoPictureCollectionCell * cell = (OrderInfoPictureCollectionCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    [cell addRotationXAnimation:M_PI*2];
    if (indexPath.section == 0) {
        
    }
}

@end



@interface OrderInfoPictureCollectionCell()
@property (nonatomic,strong) UIImageView * imageView;
@end
@implementation OrderInfoPictureCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
        
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imageView];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    _imageView.layer.shadowColor = BlackColor.CGColor;
    _imageView.layer.shadowOffset = CGSizeMake(5, 5);
    _imageView.layer.shadowOpacity = 0.5;
    [_imageView addCornerRadiusAnimation:5];
    _imageView.clipsToBounds = YES;
    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;
}
- (void)initCellWithImgUrl:(NSString *)imgUrl
{
    [_imageView sd_setImageWithURL:url(imgUrl)];
}
@end

@interface DCOrderInfoRemarkCell()
@property (nonatomic,strong) UITextView * textView;
@end
@implementation DCOrderInfoRemarkCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews
{
    [super setupSubViews];
    _textView = [[UITextView alloc]init];
    [self.contentView addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0).offset(5);
        make.bottom.right.mas_equalTo(0).offset(-5);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
}
- (void)initCellWithModel:(CLRescueOrderDetailModel *)model
{
    self.titleLabel.text = @"备注";
    NSString * remark = [NSString stringWithFormat:@"%@",model.remark];
    _textView.text = remark.length < 1 ? @"没有留言" : remark;
}
@end

@interface DCOrderInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) QMUIButton * refuseBtn, * acceptBtn;
@property (nonatomic,strong) CLRescueOrderDetailModel * model;
@end

@implementation DCOrderInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews {
    [super setupSubViews];
    _refuseBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"拒单"];
    _refuseBtn.backgroundColor = WhiteColor;
    [_refuseBtn setTitleColor:BlackColor forState:UIControlStateNormal];
    _refuseBtn.titleLabel.font = Medium(18);
    [self.view addSubview:_refuseBtn];
    _acceptBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"接单"];
    _acceptBtn.backgroundColor = navbar_tint_color;
    [_acceptBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
    _acceptBtn.titleLabel.font = Medium(18);
    [self.view addSubview:_acceptBtn];
    [_refuseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.right.equalTo(self.view.mas_centerX);
        make.height.equalTo(@50);
    }];
    [_acceptBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.left.equalTo(self.view.mas_centerX);
        make.height.equalTo(@50);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    MJRefreshStateHeader * header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        CLRescueOrderDetailRequest * req = [[CLRescueOrderDetailRequest alloc]initWithOrder_no:self.order_no
                                                                                      order_id:self.order_id];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
            info = [info objectForKey:@"msg"];
            _model = nil;
            _model = [[CLRescueOrderDetailModel alloc]init];
            _model = [CLRescueOrderDetailModel modelWithJSON:info];
            [_tableView.mj_header endRefreshing];
            debug_NSLog(@"info = %@",info);
            [_tableView reloadData];
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        }];
    }];
    _tableView.mj_header = header;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.equalTo(_refuseBtn.mas_top);
    }];
    [DCOrderInfoPlacesCell registerToTableView:_tableView];
    [DCOrderInfoCustomerInfoCell registerToTableView:_tableView];
    [DCOrderInfoPicsCell registerToTableView:_tableView];
    [DCOrderInfoRemarkCell registerToTableView:_tableView];
    [_tableView.mj_header beginRefreshing];
    [_refuseBtn blockEvent:^(QMUIButton *button) {
        [self showCancelView];
    }];
    [_acceptBtn blockEvent:^(QMUIButton *button) {
        [self refuseOrder:1];
    }];
}

- (void)showCancelView
{
    QMUIAlertController * alertController = [QMUIAlertController alertControllerWithTitle:@"拒单" message:@"你确认要拒绝该订单吗？" preferredStyle:QMUIAlertControllerStyleAlert];
    QMUIAlertAction * cancelAction = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:^(QMUIAlertAction *action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    cancelAction.buttonAttributes = @{NSFontAttributeName:Medium(18)};
    [alertController addAction:cancelAction];
    
    QMUIAlertAction * confirmAction = [QMUIAlertAction actionWithTitle:@"确定" style:QMUIAlertActionStyleDefault handler:^(QMUIAlertAction *action) {
        [self refuseOrder:2];
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    confirmAction.buttonAttributes = @{NSForegroundColorAttributeName:RGB(230, 46, 46, 1),NSFontAttributeName:Medium(18)};
    [alertController addAction:confirmAction];
    [alertController showWithAnimated:YES];
}

- (void)refuseOrder:(NSInteger)status
{
    
    
    [[BMKLocationTool shareInstance] adsRequestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        NSString * orderStart = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@",location.rgcData.province]];
        orderStart = [orderStart stringByAppendingString:[NSString stringWithFormat:@"%@",location.rgcData.city]];
        orderStart = [orderStart stringByAppendingString:[NSString stringWithFormat:@"%@",location.rgcData.district]];
        orderStart = [orderStart stringByAppendingString:[NSString stringWithFormat:@"%@",location.rgcData.street]];
        orderStart = [orderStart stringByAppendingString:[NSString stringWithFormat:@"%@",location.rgcData.streetNumber]];
        orderStart = [orderStart stringByAppendingString:[NSString stringWithFormat:@"%@",location.rgcData.locationDescribe]];
        
        CLLocationCoordinate2D coord = location.location.coordinate;
        
        CLDriverWorkOrderProcessRequest * req = [[CLDriverWorkOrderProcessRequest alloc]initWithOrderNo:_model.order_no
                                                                                                 status:status
                                                                                             orderStart:orderStart
                                                                                              orderGPSx:coord.latitude
                                                                                              orderGPSy:coord.longitude
                                                                                                 reason:@"没有为什么"];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
            if (state == 2) {
                debug_NSLog(@"拒单成功:%@",info);
            }else{
                debug_NSLog(@"接单成功:%@",info);
            }
            [self showText:[NSString stringWithFormat:@"%@",info[@"msg"]]];
            
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
            if (state == 2) {
                debug_NSLog(@"拒单失败:%@",info);
            }else{
                debug_NSLog(@"接单失败:%@",info);
            }
            [self showText:[NSString stringWithFormat:@"%@",info[@"msg"]]];
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupDataSource];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DCOrderInfoPlacesCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderInfoPlacesCell)];
        if (!cell) {
            cell = [[DCOrderInfoPlacesCell alloc]initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:stringFromClass(DCOrderInfoPlacesCell)];
        }
        [cell initCellWithModel:_model];
        return cell;
    }else if (indexPath.section == 1){
        DCOrderInfoCustomerInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderInfoCustomerInfoCell)];
        if (!cell) {
            cell = [[DCOrderInfoCustomerInfoCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                     reuseIdentifier:stringFromClass(DCOrderInfoCustomerInfoCell)];
        }
        [cell initCellWithModel:_model];
        return cell;
    }else if (indexPath.section == 2){
        DCOrderInfoPicsCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderInfoPicsCell)];
        if (!cell) {
            cell = [[DCOrderInfoPicsCell alloc]initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:stringFromClass(DCOrderInfoPicsCell)];
        }
        [cell initWithModel:_model];
        return cell;
    }else if (indexPath.section == 3){
        DCOrderInfoRemarkCell * cell = [tableView dequeueReusableCellWithIdentifier:stringFromClass(DCOrderInfoRemarkCell)];
        if (!cell) {
            cell = [[DCOrderInfoRemarkCell alloc]initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:stringFromClass(DCOrderInfoRemarkCell)];
        }
        [cell initCellWithModel:_model];
        return cell;
    }else{
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    }else if (indexPath.section == 1){
        return 60;
    }else if (indexPath.section == 2){
        return 180;
    }
    else if (indexPath.section == 3){
        return 180;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
