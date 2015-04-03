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

@interface MyGardenDetailViewController : UIViewController{
    NSArray *plantArry;
}


@property (strong, nonatomic)PFObject *gardenObject;
@property (strong, nonatomic)IBOutlet UILabel *plantDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *germDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *tranDateLabel;
@property (strong, nonatomic)IBOutlet UILabel *harvDateLabel;
@property (strong, nonatomic)IBOutlet UIImageView *plantImage;


@end
