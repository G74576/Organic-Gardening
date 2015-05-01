//
//  PlantDetailViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantListTableViewController.h"
#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>

@interface PlantDetailViewController : UIViewController<UIAlertViewDelegate>{
    
    IBOutlet UIScrollView *scrollView;
    
}

@property (strong, nonatomic)PFObject *plantObject;

@property (strong, nonatomic)IBOutlet UILabel *details;
@property (strong, nonatomic)IBOutlet UILabel *difficulty;
@property (strong, nonatomic)IBOutlet UILabel *zone;
@property (strong, nonatomic)IBOutlet UILabel *sun;
@property (strong, nonatomic)IBOutlet UILabel *water;
@property (strong, nonatomic)IBOutlet UILabel *soil;
@property (strong, nonatomic)IBOutlet UILabel *best;
@property (strong, nonatomic)IBOutlet UILabel *container;
@property (strong, nonatomic)IBOutlet UILabel *germ;
@property (strong, nonatomic)IBOutlet UILabel *trans;
@property (strong, nonatomic)IBOutlet UILabel *harv;
@property (strong, nonatomic)IBOutlet UILabel *tips;
@property (strong, nonatomic)IBOutlet UILabel *spacing;
@property (strong, nonatomic)IBOutlet UILabel *height;
@property (strong, nonatomic)IBOutlet UIImageView *plantImage;

@property (strong, nonatomic)IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic)NSString *buttonHidden;
@property (strong, nonatomic) IBOutlet UIButton *editDetails;

-(IBAction)addToGarden:(id)sender;

@end
