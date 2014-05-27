//
//  WebViewController.m
//  MeetMeUp
//
//  Created by David Warner on 5/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadIndicator;

@end

@implementation WebViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];
}

- (IBAction)onBackButtonPressed:(id)sender
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }

}

- (IBAction)onForwardButtonPressed:(id)sender
{
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    self.loadIndicator.color = [UIColor blueColor];
    [self.loadIndicator startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadIndicator stopAnimating];
}

@end
