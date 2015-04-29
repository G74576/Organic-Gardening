//
//  UserSettingsViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/16/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "UserSettingsViewController.h"
#import "FirstViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController
@synthesize firstName, lastName, nuserName, emailAdd, userPassword, userObj, fbLogin, twLogin, nLogin;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.nuserName.delegate = self;
    self.emailAdd.delegate = self;
    self.userPassword.delegate = self;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.nuserName resignFirstResponder];
    [self.emailAdd resignFirstResponder];
    [self.userPassword resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

//Checking to see how the user is logged in to the app.
-(void)viewDidAppear:(BOOL)animated{
    BOOL linkedWithFacebook = [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]];
    BOOL linkedWithTwitter = [PFTwitterUtils isLinkedWithUser:[PFUser currentUser]];
    
    if (linkedWithFacebook) {
        fbLogin = YES;
    } else if (linkedWithTwitter){
        twLogin = YES;
    } else {
        nLogin = YES;
    }
    
    if (fbLogin == YES) {
        NSLog(@"Facebook Login");
    }
    if (twLogin == YES) {
        NSLog(@"Twitter Login");
    }
    if (nLogin == YES){
        NSLog(@"Normal Login");
    }
    NSLog(fbLogin ? @"Yes" : @"No");
    NSLog(twLogin ? @"Yes" : @"No");
    NSLog(nLogin ? @"Yes" : @"No");
    [self getUserInformation];
}

//Getting User Information
-(void)getUserInformation{

    if (nLogin == YES) {
        PFQuery *query = [PFUser query];
        PFUser *user = [PFUser currentUser];
        [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            firstName.text = [object objectForKey:@"firstName"];
            lastName.text = [object objectForKey:@"lastName"];
            emailAdd.text = [object objectForKey:@"email"];
            nuserName.text = user.username;
        }];
    } else {
        PFQuery *query = [PFUser query];
        [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            firstName.text = [object objectForKey:@"firstName"];
            lastName.text = [object objectForKey:@"lastName"];
        }];
        nuserName.enabled = NO;
        emailAdd.enabled = NO;
        userPassword.enabled = NO;
        [[[UIAlertView alloc] initWithTitle:@"ALERT"
                                    message:@"You are logged in through Facebook or Twitter.  Must be logged in through Organic Gardening account to change or update username, email and password. You are albe to add a first and last name."
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
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

- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}


//Update / Save information in parse database
-(void)saveInfo{
    
    PFQuery *query = [PFUser query];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        object[@"lastName"] = lastName.text;
        object[@"firstName"] = firstName.text;
        if ([nuserName.text isEqual:@""]) {
            user.username = user.username;
        } else {
            user.username = nuserName.text;
        }
        if ([emailAdd.text isEqual:@""]) {
            user.email = user.email;
        } else {
        user.email = emailAdd.text;
        }
        if ([userPassword.text isEqual:@""]) {
            
        } else {
            user.password = userPassword.text;
        }
        
        [user save];
        [object saveInBackground];
    }];
    
    UIAlertView *saved = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"User Information has been saved"] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [saved show];

}


//Button to save information - will check for errors then call alertview
- (IBAction)save:(id)sender {
    if ([firstName.text isEqual:@""]) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Please enter a first name.", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }
    else if ([lastName.text isEqual:@""]) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Please enter a last name.", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (![firstName.text isEqual:@""] && ![lastName.text isEqual:@""]){

        if ([PFUser currentUser]) {
            UIAlertView *addToGarden = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Save Changes?"] message:nil delegate:self cancelButtonTitle:@"Save" otherButtonTitles:@"Cancel", nil];
            
            [addToGarden show];
        } else {
        }
    }
}


//Alert View Delegate 
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Save"]) {
        [self saveInfo];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
}

@end
