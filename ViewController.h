//
//  ViewController.h
//  iKEA
//
//  Created by Novall Khan on 11/17/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *aisleButton;
@property (strong, nonatomic) IBOutlet UIButton *furnitureButton;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@property (strong, nonatomic) IBOutlet UIImageView *dottedLine1;
@property (strong, nonatomic) IBOutlet UIImageView *dottedLine3;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView2;

- (IBAction)aisleButtonPressed:(id)sender;
- (IBAction)furnitureButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;


@end

