//
//  OPUrl.m
//  WebView
//
//  Created by Oleg Pochtovy on 17.02.15.
//  Copyright (c) 2015 Oleg Pochtovy. All rights reserved.
//

#import "OPUrl.h"

@implementation OPUrl

- (OPUrl *)initWithTitle:(NSString *)title andHref:(NSString *)href {
    
    self = [super init];
    
    if (self) {
        
        self.title = title;
        self.href = href;
        
    }
    
    return self;
}

+ (OPUrl *)createUrlWithTitle:(NSString *)title andHref:(NSString *)href {
    
    OPUrl *url = [[OPUrl alloc] init];
    
    url.title = title;
    
    url.href = href;
    
    return url;
}

@end