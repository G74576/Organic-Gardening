//
//  UserSettingsViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/16/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface UserSettingsViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>{
    NSArray *userArray;
}

@property (strong, nonatomic) PFObject *userObj;

@property BOOL fbLogin;
@property BOOL twLogin;
@property BOOL nLogin;

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *nuserName;
@property (strong, nonatomic) IBOutlet UITextField *emailAdd;
@property (strong, nonatomic) IBOutlet UITextField *userPassword;

- (IBAction)save:(id)sender;


@end
