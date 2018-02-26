//
//  UITableView+SearchBarCategory.m
//  51carlife
//
//  Created by lijun mou on 2018/1/5.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "UITableView+SearchBarCategory.h"
#import <objc/runtime.h>




@interface UITableView()<UISearchBarDelegate>
@property (nonatomic,retain) UISearchBar * searchBar;

@end

@implementation UITableView (SearchBarCategory)
static CGFloat searchBarHeight = 50;
static char * delegateKey = "delegateKey";
static char * searchBarKey = "searchBarKey";
static UITableView * tableView;

- (void)setSearchDelegate:(id<SearchBarTableViewDelegate>)searchDelegate
{
    objc_setAssociatedObject(self, &delegateKey, searchDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (id<SearchBarTableViewDelegate>)searchDelegate
{
    return objc_getAssociatedObject(self, &delegateKey);
}

- (void)setSearchBar:(UISearchBar *)searchBar{
    objc_setAssociatedObject(self, &searchBarKey, searchBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UISearchBar *)searchBar
{
    return objc_getAssociatedObject(self, &searchBarKey);
}

- (instancetype)cl_initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    tableView = [[UITableView alloc]initWithFrame:frame style:style];
    if (tableView){
        [self setupSubViews];
    }
    return tableView;
}

- (void)setupSubViews
{
    [super setupSubViews];
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, searchBarHeight)];
    self.searchBar.delegate = tableView;
    tableView.tableHeaderView = self.searchBar;
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0)
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED
{
    
}
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED
{
    
}
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0)
{
    
}
@end
