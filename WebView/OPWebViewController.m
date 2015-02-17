//
//  OPWebViewController.m
//  WebView
//
//  Created by Oleg Pochtovy on 17.02.15.
//  Copyright (c) 2015 Oleg Pochtovy. All rights reserved.
//

// UIWebView has UIActivityIndicator and there are buttons "Back" and "Forward" in the navigation bar

#import "OPWebViewController.h"

@interface OPWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) UIBarButtonItem *backButtonItem;
@property (strong, nonatomic) UIBarButtonItem *forwardButtonItem;

@end

@implementation OPWebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSMutableString *urlString = [NSMutableString string];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    [self.webView loadRequest:request];
    
    self.backButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                                target:self
                                                                        action:@selector(actionBack:)];
    
    self.forwardButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                           target:self
                                                                           action:@selector(actionForward:)];
    
    UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                           target:self
                                                                           action:@selector(actionRefresh:)];
    
    self.navigationItem.rightBarButtonItems = @[self.forwardButtonItem, refreshButtonItem, self.backButtonItem];
    
}

#pragma mark - Actions

- (void)actionBack:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    
}

- (void)actionForward:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
    
}

- (void)actionRefresh:(UIBarButtonItem *)sender {
    
    [self.webView stopLoading];
    [self.webView reload];
    
}

#pragma mark - Private Methods

// In my private method I activate the buttons self.backButtonItem and self.forwardButtonItem
- (void)refreshButtons {
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    // I put an UIActivityIndicator on the screen in this delegate method
    [self.indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // I removed an UIActivityIndicator from the screen in this delegate method
    [self.indicator stopAnimating];
    
    [self refreshButtons];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
    
}

@end
