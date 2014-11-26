//
//  InfoViewController.m
//  iKEA
//
//  Created by Novall Khan on 11/26/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import "InfoViewController.h"
#import "GoogleAnalytics.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [GoogleAnalytics trackUIActionCategoryWithAction:GoogleAnalyticsActionNavigation
                                               label:GoogleAnalyticsLabelNavigatedToInfoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
