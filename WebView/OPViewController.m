//
//  OPViewController.m
//  WebView
//
//  Created by Oleg Pochtovy on 17.02.15.
//  Copyright (c) 2015 Oleg Pochtovy. All rights reserved.
//

// 1. The app illustrates how to create UIViewController with tableView having two sections: pdf files and url links.
// 2. If you press a cell in the tableView your get a pdf file or a web page through push navigation.
// 3. I used the only VC for both pdf and url.
// 4. I used UIActivityIndicator and UIBarButtonItems Back and Forward for navigation between different web pages.

#import "OPViewController.h"
#import "OPUrl.h"
#import "OPWebViewController.h"

@interface OPViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sectionsArray;

@end

@implementation OPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *firstSection = [NSArray arrayWithObjects:@"1.pdf", @"2.pdf", nil];
    
    // I need to create a new class OPUrl for url links
    
    OPUrl *url1 = [[OPUrl alloc] initWithTitle:@"Yandex" andHref:@"http://yandex.ru"];
    OPUrl *url2 = [OPUrl createUrlWithTitle:@"Swift guide" andHref:@"https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309"];
    
    NSArray *secondSection = [NSArray arrayWithObjects:url1, url2, nil];
    
    self.sectionsArray = [NSMutableArray arrayWithObjects:firstSection, secondSection, nil];
    
    self.tableView.editing = NO;
    
    self.navigationItem.title = @"WebView App";
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.sectionsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return (section == 0) ? @"PDF files" : @"URLs";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *array = [self.sectionsArray objectAtIndex:section];
    
    return [array count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *array = [self.sectionsArray objectAtIndex:indexPath.section];
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [array objectAtIndex:indexPath.row]];
        
    } else {
        
        OPUrl *url = [array objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", url.title];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // I need to create a new class OPWebViewController
    
    OPWebViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OPWebViewController"];
    
    NSArray *array = [self.sectionsArray objectAtIndex:indexPath.section];
    
    if (indexPath.section == 0) {
        
        webVC.title = [array objectAtIndex:indexPath.row];
        
        webVC.urlString = webVC.title;
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:[array objectAtIndex:indexPath.row] ofType:nil];
        
        webVC.url = [NSURL fileURLWithPath:filePath];
        
    } else {
        
        OPUrl *url = [array objectAtIndex:indexPath.row];
        webVC.title = url.title;
        
        webVC.urlString = url.href;
        
        webVC.url = [NSURL URLWithString:url.href];
        
    }
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}

@end
