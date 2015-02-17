//
//  OPWebViewController.h
//  WebView
//
//  Created by Oleg Pochtovy on 17.02.15.
//  Copyright (c) 2015 Oleg Pochtovy. All rights reserved.
//

// I added a new UIViewController in the storyboard, chose the class OPWebViewController, Storyboard ID = OPWebViewController and put a new object UIWebView

#import <UIKit/UIKit.h>

@interface OPWebViewController : UIViewController <UIWebViewDelegate> // I made the OPWebViewController the delegate of the UIWebView in storyboard and connected IBOutlet with code

@property (strong, nonatomic) NSString *urlString;

@property (strong, nonatomic) NSURL *url;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator; // in the storyboard I added an object UIActivityIndicatorView and connected IBOutlet with code

@end