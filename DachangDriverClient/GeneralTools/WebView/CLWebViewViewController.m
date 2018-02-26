//
//  CLWebViewViewController.m
//  51carlife
//
//  Created by lijun mou on 2018/1/29.
//  Copyright © 2018年 aidongsheng. All rights reserved.
//

#import "CLWebViewViewController.h"

@interface CLWebViewViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView * webView;
@end

@implementation CLWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]init];
    _webView.allowsLinkPreview = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    
    NSURL * requestURL = url(_url);
    NSError * error = nil;
    [requestURL checkResourceIsReachableAndReturnError:&error];
    if (error) {
        [QMUITips showError:@"无效的网址" inView:self.view hideAfterDelay:1];
    }else{
        [_webView loadRequest:[NSURLRequest requestWithURL:url(_url)]];
    }
}
- (void)backToIndexController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [QMUITips showLoadingInView:self.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [QMUITips hideAllToastInView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [QMUITips showError:@"网页加载失败" inView:self.view hideAfterDelay:1];
    
}
- (void)refreshWebService {
    [_webView loadRequest:[NSURLRequest requestWithURL:url(_url)]];
}
@end
