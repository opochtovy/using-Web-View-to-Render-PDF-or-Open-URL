//
//  OPUrl.h
//  WebView
//
//  Created by Oleg Pochtovy on 17.02.15.
//  Copyright (c) 2015 Oleg Pochtovy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OPUrl : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *href;

- (OPUrl *)initWithTitle:(NSString *)title andHref:(NSString *)href;

+ (OPUrl *)createUrlWithTitle:(NSString *)title andHref:(NSString *)href;

@end