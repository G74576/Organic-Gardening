//
//  MyGardenDetailViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/2/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "MyGardenTableViewController.h"

@interface MyGardenDetailViewController : UIViewController<UIAlertViewDelegate>{
    NSArray *plantArry;
    NSString *objectID;
    UIDatePicker *datePicker;
}


@property (strong, nonatomic)PFObject *gardenObject;
@property (strong, nonatomic)PFObject *dateObject;
@property (strong, nonatomic)PFObject *userDateObjet;
@property (strong, nonatomic)IBOutlet UILabel *plantDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *germDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *tranDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *harvDateLabel;
@property (strong, nonatomic)IBOutlet UIImageView *plantImage;
@property (strong, nonatomic) IBOutlet UILabel *plantHeader;
@property (strong, nonatomic) IBOutlet UILabel *germHeader;
@property (strong, nonatomic) IBOutlet UILabel *tranHeader;
@property (strong, nonatomic) IBOutlet UILabel *harvHeader;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)editDate:(id)sender;
- (IBAction)saveDate:(id)sender;

@end
