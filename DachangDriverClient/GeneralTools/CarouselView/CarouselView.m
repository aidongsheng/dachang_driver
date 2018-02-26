//
//  CarouselView.m
//  xinxiangjia
//
//  Created by aidongsheng on 2017/12/6.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CarouselView.h"
#import "CarouselCollectionViewCell.h"


@interface CarouselView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) UIPageControl * pageControl;

@property (nonatomic,assign) PageControlPositon position;
@property (nonatomic,assign) UICollectionViewScrollDirection collectionViewScrollDirection;
@property (nonatomic,assign) NSInteger timeCount;
@end

@implementation CarouselView

- (instancetype)initwithPageControlPositon:(PageControlPositon)positon
               pageControlCurrentTintColor:(UIColor *)currentTintColor
             pageControlIndicatorTintColor:(UIColor *)indicatorTintColor
{
    if(self == [super init]){
        if (positon == PageControlPositonLeft || positon == PageControlPositonRight) {
            _collectionViewScrollDirection = UICollectionViewScrollDirectionVertical;
        }else{
            _collectionViewScrollDirection = UICollectionViewScrollDirectionHorizontal;
        }
        
        [self setupSubViews];
        [self configureActions];
        _position = positon;
        [self initializePageControl:_pageControl
                 pageControlPositon:positon
      currentPageIndicatorTintColor:currentTintColor
      pageControlIndicatorTintColor:indicatorTintColor];
    }
    return self;
}

/**
 开始播放图片
 */
- (void)startCarouseling{
    _timeCount++;
    NSInteger currentIndex = _timeCount%_aidsModel.ads.count;
    _pageControl.currentPage = currentIndex;
    [self scrollCollectionViewToIndex:currentIndex];
}

/**
 将 collectionView 滚动至指定下标处

 @param collectionViewIndex 指定下标
 */
- (void)scrollCollectionViewToIndex:(NSInteger)collectionViewIndex
{
    CGRect visibleRect;
    if (_position == PageControlPositonRight || _position == PageControlPositonLeft) {
        visibleRect = CGRectMake(0, collectionViewIndex*_collectionView.frame.size.height, _collectionView.frame.size.width, _collectionView.frame.size.width);
    }else{
        visibleRect = CGRectMake(collectionViewIndex*_collectionView.frame.size.width,0, _collectionView.frame.size.width, _collectionView.frame.size.width);
    }
    [_collectionView scrollRectToVisible:visibleRect animated:YES];
}
/**
 初始化 pagecontrol 控件

 @param pageControl 待初始化 pagecontrol 控件
 @param position pagecontrol 控件所处的位置
 @param currentPageIndicatorTintColor 当前选中 pagecontrol 控件的颜色
 @param pageControlIndicatorTintColor 未被选中 pagecontrol 空间的颜色
 */
- (void)initializePageControl:(UIPageControl *)pageControl pageControlPositon:(PageControlPositon)position currentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor pageControlIndicatorTintColor:(UIColor *)pageControlIndicatorTintColor
{
    pageControl.numberOfPages = _aidsModel.ads.count;
    pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    pageControl.pageIndicatorTintColor = pageControlIndicatorTintColor;
    pageControl.hidesForSinglePage = YES;
    [pageControl addTarget:self action:@selector(didTapPageControlAtIndex:) forControlEvents:UIControlEventValueChanged];
}

/**
 pagecontrol控件点击事件

 @param pageControl 被点击 pagecontrol 控件
 */
- (void)didTapPageControlAtIndex:(UIPageControl *)pageControl
{
    debug_NSLog(@"%li",pageControl.currentPage);
    NSInteger currentPage = pageControl.currentPage;
    _timeCount++;
    [self scrollCollectionViewToIndex:currentPage];
}

/**
 布局 pagecontrol 控件

 @param position 根据定义的位置信息设置 pagecontrol 控件的 frame
 */
- (void)layoutPageControl:(PageControlPositon)position
{
    if (position == PageControlPositonTop) {
        [_pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];
    }else if (position == PageControlPositonLeft){
        
        [_pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.centerX.equalTo(self.mas_left).offset(10);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];
        [_pageControl addRotationAnimation:M_PI_2];
    }else if (position == PageControlPositonBottom){
        [_pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];
    }else if (position == PageControlPositonRight){
        [_pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.centerX.equalTo(self.mas_right).offset(-10);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.height.equalTo(@20);
        }];
        [_pageControl addRotationAnimation:M_PI_2];
    }
}

/**
 布局子视图
 */
- (void)setupSubViews
{
    [super setupSubViews];
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = _collectionViewScrollDirection;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView.showsHorizontalScrollIndicator = false;
    _collectionView.showsVerticalScrollIndicator = false;
    _collectionView.pagingEnabled = YES;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [CarouselCollectionViewCell registerClassforCellToCollectionView:_collectionView];
    [self addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    _pageControl = [[UIPageControl alloc]init];
    [self addSubview:_pageControl];
}

/**
 设置 collectionView frame 时布局 pagecontrol 控件 frame

 @param frame collectionView 的 frame
 */
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self layoutPageControl:_position];
}

/**
 使用Masonry 布局 collectionView 时布局 pagecontrol 控件的frame

 @param block collectionView 布局的 MASConstraintMaker block (scope within which you can build up the constraints which you wish to apply to the view.)
 @return Array of created MASConstraints
 */
- (NSArray *)mas_makeConstraints:(void (^)(MASConstraintMaker *))block
{
     [self layoutPageControl:_position];
    return [super mas_makeConstraints:block];
}

- (void)configureActions
{
    [super configureActions];
    
}

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _aidsModel.ads.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CarouselCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CarouselCollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    CLIndexPageAidItemModel * model = _aidsModel.ads[indexPath.row];
    [cell setupCell:model];
    
    return cell;
}

    // 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width,self.frame.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


/**
 设置collectionViewCell行间距
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return cell 的行间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

/**
 设置collectionViewCell列间距
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return cell 的列间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

/**
 集合视图头部视图大小
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return section header 的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}


/**
 集合视图尾部视图大小
 
 @param collectionView 集合视图
 @param collectionViewLayout 集合视图布局对象
 @param section 集合视图 section 单位
 @return section footer 的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
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
    debug_NSLog(@"选中了第%li个图片",indexPath.row);
    if (self.delegate && [self.delegate respondsToSelector:@selector(carouselViewDidTapImageAtIndex:)]) {
        [self.delegate carouselViewDidTapImageAtIndex:indexPath.row];
    }
}

    // 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

    // 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
        {
        debug_NSLog(@"拷贝、粘贴");
        return YES;
        }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    debug_NSLog(@"performAction");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_position == PageControlPositonRight || _position == PageControlPositonLeft) {
        NSInteger index = (NSInteger)scrollView.contentOffset.y/_collectionView.frame.size.height;
        debug_NSLog(@"下标:%ld",index);
        _pageControl.currentPage = index;
        
    }else{
        NSInteger index = (NSInteger)scrollView.contentOffset.x/_collectionView.frame.size.width;
        debug_NSLog(@"下标:%ld",index);
        _pageControl.currentPage = index;
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _timeCount++;
}

- (void)setAidsModel:(CLIndexPageAidsModel *)aidsModel
{
    _aidsModel = aidsModel;
    
    if (@available(iOS 10.0, *)) {
        [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
            _timeCount++;
            NSInteger currentIndex = _timeCount%_aidsModel.ads.count;
            
            _pageControl.currentPage = currentIndex;
            [self scrollCollectionViewToIndex:currentIndex];
        }];
    } else {
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(startCarouseling) userInfo:nil repeats:YES];
    }
}

@end

