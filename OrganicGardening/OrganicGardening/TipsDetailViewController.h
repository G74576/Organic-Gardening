//
//  TipsDetailViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import "TipsTableViewController.h"

@interface TipsDetailViewController : UIViewController

@property(strong, nonatomic)PFObject *tipsObject;

@property(strong, nonatomic)IBOutlet UILabel *tipName;
@property(strong, nonatomic)IBOutlet UITextView *tipDes;

-(IBAction)editTip:(id)sender;

@end
