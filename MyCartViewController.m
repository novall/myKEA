//
//  MyCartViewController.m
//  iKEA
//
//  Created by Novall Khan on 11/19/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import "MyCartViewController.h"

@interface MyCartViewController () <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@end

@implementation MyCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView DataSource and Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    //  NSArray *placeholderArray = @[@"lamp", @"table", @"chairs", @"plates", @"pots", @"pans", @"desk"];
    //  cell.textLabel.text = placeholderArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    [label setFont:[UIFont systemFontOfSize:20]];
    label.textAlignment = NSTextAlignmentCenter;
    NSString *string =@"My Cart";
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [label setTextColor:[UIColor darkGrayColor]];
    [view setBackgroundColor:[UIColor whiteColor]];
    return view;
}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cameraSegueButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
