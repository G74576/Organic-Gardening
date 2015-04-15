//
//  SecondViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/17/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface SecondViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>{
    
    SLComposeViewController *slcompose;

    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *takeButton;
    IBOutlet UIButton *clearButton;
    IBOutlet UIButton *retakeButton;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *faceBookButton;
    IBOutlet UIButton *twitterButton;
    IBOutlet UILabel *header;
    IBOutlet UILabel *headerback;
    
    UIImagePickerController *picker;
    UIImage *image;
    
}

@property(strong, atomic)ALAssetsLibrary *library;

-(IBAction)takePhoto:(id)sender;
-(IBAction)clearPhoto:(id)sender;
-(IBAction)savePhoto:(id)sender;
-(IBAction)postFacebook:(id)sender;
-(IBAction)postToTwitter:(id)sender;

@end

