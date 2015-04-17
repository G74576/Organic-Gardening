//
//  EditTipViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/16/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface EditTipViewController : UIViewController<UITextViewDelegate, UITextFieldDelegate,UIAlertViewDelegate>{

    NSString *objectID;
    NSString *editNameText;
    NSString *editDesText;
}

@property(strong, nonatomic)PFObject *editObject;

@property(strong, nonatomic)IBOutlet UITextField *editTipName;
@property(strong, nonatomic)IBOutlet UITextView *editTipDes;

-(IBAction)saveButton:(id)sender;

@end
