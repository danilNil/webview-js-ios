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
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"LocalPage" ofType:@"html" inDirectory:nil];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    //Append javascript
    NSString *script = @"<script>alert(\"This is an alert!!\");</script>";
    htmlString = [htmlString stringByAppendingString:script];
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

@end
