//
//  ViewController.m
//  iKEA
//
//  Created by Novall Khan on 11/17/14.
//  Copyright (c) 2014 Novall Khan. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface ViewController () < ADBannerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet ADBannerView *adBanner;

@property (nonatomic, assign) BOOL isAisleTag;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.adBanner.delegate = self;
    self.adBanner.alpha = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dottedLine1.hidden = NO;
    self.dottedLine3.hidden = YES;
    self.isAisleTag = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Camera Actions

- (IBAction)furnitureButtonPressed:(id)sender {
    
    self.isAisleTag = NO;
    
    self.dottedLine3.hidden = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    //self.dottedLine1.frame = CGRectMake(10, 6, 140, 138);
    self.dottedLine1.frame = CGRectMake(160, 6, 140, 138);
    [UIView commitAnimations];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
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
    
    [self presentViewController:picker animated:YES completion:nil];
}




- (IBAction)aisleButtonPressed:(id)sender {
    
    self.dottedLine3.hidden = YES;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    //self.dottedLine1.frame = CGRectMake(10, 6, 140, 138);
    self.dottedLine1.frame = CGRectMake(10, 6, 140, 138);
    [UIView commitAnimations];
    
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
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)doneButtonPressed:(id)sender
{
    self.isAisleTag = NO;
    self.dottedLine3.hidden = YES;
    
    // Reset
    [self.aisleButton setImage:[UIImage imageNamed:@"aisle_tag"] forState:UIControlStateNormal];
    [self.furnitureButton setImage:[UIImage imageNamed:@"chairButton"] forState:UIControlStateNormal];
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
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:0.7];
             self.dottedLine1.frame = CGRectMake(160, 6, 140, 138);
             [UIView commitAnimations];
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
        self.dottedLine3.hidden = NO;
    }
    
    self.isAisleTag = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Ad Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
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
