//
//  FirstViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/17/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface FirstViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>{

}

-(IBAction)logOut:(id)sender;

@end

