//
//  UserSettingsViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/16/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "UserSettingsViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface UserSettingsViewController ()

@end

@implementation UserSettingsViewController
@synthesize firstName, lastName, emailAdd, currentPassword, userPassword, userObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self getUserInformation];
    
    

}

-(void)getUserInformation{
//    
//        PFQuery *query = [PFUser query];
//        [query whereKey:@"username" equalTo:[[PFUser currentUser]username]];
//        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//            firstName.text = [object objectForKey:@"firstName"];
//            lastName.text = [object objectForKey:@"lastName"];
//            emailAdd.text = [object objectForKey:@"email"];
//        }];
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

- (IBAction)save:(id)sender {
}

@end
