//
//  AboutViewController.m
//  myBullsEye
//
//  Created by 陈旭 on 5/1/15.
//  Copyright (c) 2015 陈旭. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"BullsEye" ofType:@"html"];
    NSData *htmlDate = [NSData dataWithContentsOfFile:htmlPath];
    [self.webView loadData:htmlDate MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
