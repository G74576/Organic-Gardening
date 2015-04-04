//
//  TipsAddViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/3/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface TipsAddViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>{

}

@property(strong, nonatomic)IBOutlet UITextField *tipName;
@property(strong, nonatomic)IBOutlet UITextView *tipDes;

-(IBAction)saveButton:(id)sender;

@end
