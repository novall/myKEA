//
//  ViewController.m
//  myKEA
//
//  Created by Novall Khan on 11/17/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>
#import "GoogleAnalytics.h"
#import "Theme+Colors.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () < ADBannerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet ADBannerView *adBanner;

@property (nonatomic, assign) BOOL isAisleTag;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.adBanner.delegate = self;
    self.adBanner.alpha = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dottedLine1.hidden = NO;
    self.isAisleTag = NO;
    
    self.view.backgroundColor = [Theme myKEALightGrey];
    [self setUpHolderViews];
    self.dottedLine1.frame = CGRectMake(self.buttonHolderView.frame.origin.x,
                                        4,
                                        2,
                                        2);

    [UIView animateWithDuration:1.0 animations:^{
        self.dottedLine1.frame = CGRectMake(160, 6, 140, 138);
    }];
}

- (void)setUpHolderViews
{
    NSArray *holderViewArray = @[self.cartHolderView, self.buttonHolderView];
    
    for (UIView *holderView in holderViewArray)
    {
        holderView.backgroundColor = [UIColor whiteColor];
        
        // Border
        [holderView.layer setCornerRadius:5.0f];
        [holderView.layer setBorderColor:[Theme myKEABorderColor].CGColor];
        [holderView.layer setBorderWidth:1.5f];
        
        // Shadow
        [holderView.layer setShadowColor:[UIColor grayColor].CGColor];
        [holderView.layer setShadowOpacity:0.9];
        [holderView.layer setShadowRadius:3.0];
        [holderView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Camera Actions

- (IBAction)furnitureButtonPressed:(id)sender {
    
    [GoogleAnalytics trackUIActionCategoryWithAction:GoogleAnalyticsActionCameraButtonPressed
                                               label:GoogleAnalyticsLabelCameraFurnitureActivated];
    
    self.isAisleTag = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.dottedLine1.frame = CGRectMake(160, 6, 140, 138);
    }];
    
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                              message:@"This device doesn't seem to have camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self presentViewController:picker animated:YES completion:nil];
    });
   
}


- (IBAction)aisleButtonPressed:(id)sender {
    
    [GoogleAnalytics trackUIActionCategoryWithAction:GoogleAnalyticsActionCameraButtonPressed
                                               label:GoogleAnalyticsLabelCameraRedTagActivated];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.dottedLine1.frame = CGRectMake(10, 6, 140, 138);
    }];
    
    self.isAisleTag = YES;
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                              message:@"This device doesn't seem to have a camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        [myAlertView show];
        
    }

    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self presentViewController:picker animated:YES completion:nil];
    });
}

- (IBAction)doneButtonPressed:(id)sender
{
    [GoogleAnalytics trackUIActionCategoryWithAction:GoogleAnalyticsActionNewItemAdded
                                               label:GoogleAnalyticsLabelNewItemAddedToCart];

    self.isAisleTag = NO;
    
    // Reset
    [self.aisleButton setImage:[UIImage imageNamed:@"aisle_tag"] forState:UIControlStateNormal];
    [self.furnitureButton setImage:[UIImage imageNamed:@"chairButton"] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:2.0 animations:^{
        
        self.photoImageView1.hidden = NO;
        self.photoImageView2.hidden = NO;
    
        // Shrink photoImageView to 0 to give the illusion that the items are being placed in the cart.
        self.photoImageView1.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width/2,
                                                self.cartButton.frame.origin.y,
                                                0,
                                                0);
        self.photoImageView2.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width/2,
                                                self.cartButton.frame.origin.y,
                                                0,
                                                0);
    }];

   // [self.photoImageView1 setImage:nil];
   // [self.photoImageView2 setImage:nil];
}

#pragma mark - UIImageView Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
     if (self.isAisleTag == YES)
     {
         self.photoImageView1.image = chosenImage;
         
         [self.aisleButton setImage:chosenImage forState:UIControlStateNormal];
         
         
         if (!(self.photoImageView2.image))
         {
             [UIView animateWithDuration:0.7 animations:^{
                 self.dottedLine1.frame = CGRectMake(160, 6, 140, 138);
             }];
             
         }
     }
    
    else
    {
        self.photoImageView2.image = chosenImage;
        
        [self.furnitureButton setImage:chosenImage forState:UIControlStateNormal];
        
        if (self.isAisleTag == NO)
        {
            self.dottedLine1.hidden = NO;
        }

    }
    
    
    if (self.photoImageView1.image && self.photoImageView2.image)
    {
        // Display Large dotted line to prompt user to click done.
        self.dottedLine1.hidden = YES;
    }
    
    self.isAisleTag = NO;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Text Field Delegate Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [GoogleAnalytics trackUIActionCategoryWithAction:GoogleAnalyticsActionTextAdded
                                               label:GoogleAnalyticsLabelTextFieldActivated];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    self.noteTextField.text = @"";
    [self.noteTextField resignFirstResponder];
    
    #warning COMPLETE IMPLEMENTATION - Save note bundled w/ items.
    
    return YES;
}


#pragma mark - Ad Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"Ad Banner did load ad.");
    
    // Show the ad banner.
        [UIView animateWithDuration:0.5 animations:^{
            self.adBanner.alpha = 1.0;
        }];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
    
    // Hide the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adBanner.alpha = 0.0;
    }];
}


@end
