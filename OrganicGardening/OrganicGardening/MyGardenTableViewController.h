//
//  MyGardenTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/24/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface MyGardenTableViewController : UITableViewController{
    
    NSArray *gardenArray;
}

@property(strong, nonatomic)IBOutlet UITableView *gardenTable;
@property(strong, nonatomic)IBOutlet UIBarButtonItem *editBtn;

- (IBAction)editBarBtnPressed:(id)sender;

@end
