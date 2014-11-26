//
//  ViewController.h
//  myKEA
//
//  Created by Novall Khan on 11/17/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *aisleButton;
@property (strong, nonatomic) IBOutlet UIButton *furnitureButton;
@property (strong, nonatomic) IBOutlet UITextField *noteTextField;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) IBOutlet UIButton *cartButton;

@property (strong, nonatomic) IBOutlet UIImageView *dottedLine1;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView2;
@property (strong, nonatomic) IBOutlet UIView *buttonHolderView;
@property (strong, nonatomic) IBOutlet UIView *cartHolderView;

- (IBAction)aisleButtonPressed:(id)sender;
- (IBAction)furnitureButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;


@end

