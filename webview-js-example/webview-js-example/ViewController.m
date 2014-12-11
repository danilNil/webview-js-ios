//
//  ViewController.m
//  webview-js-example
//
//  Created by Danil Nikiforov on 11.12.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSURL alloc] initWithString:@"http://chrisrisner.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:request];
}

@end
