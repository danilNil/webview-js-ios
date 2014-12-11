//
//  ViewController.m
//  webview-js-example
//
//  Created by Danil Nikiforov on 11.12.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"LocalPage" ofType:@"html" inDirectory:nil];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    //Append javascript
//    NSString *script = @"<script>alert(\"This is an alert!!\");</script>";
//    htmlString = [htmlString stringByAppendingString:script];
    self.webView.delegate = self;

    [self.webView loadHTMLString:htmlString baseURL:nil];
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *URL = [request URL];
    if ([[URL scheme] isEqualToString:@"callmycode"]) {
        NSString *urlString = [[request URL] absoluteString];
        NSArray *urlParts = [urlString componentsSeparatedByString:@":"];
        //check to see if we just got the scheme
        if ([urlParts count] > 1) {
            NSArray *parameters = [[urlParts objectAtIndex:1] componentsSeparatedByString:@"&"];
            NSString *methodName = [parameters objectAtIndex:0];
            NSString *variableName = [parameters objectAtIndex:1];
            
            NSString *message = [NSString stringWithFormat:@"Obj-c from js with methodname=%@ and variablename=%@", methodName, variableName];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Great" message:message delegate: self cancelButtonTitle: nil otherButtonTitles: @"OK",nil, nil];
            [alert show];
        }
    }
    return YES;
}

@end
