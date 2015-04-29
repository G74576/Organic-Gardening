//
//  TipsTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface TipsTableViewController : UITableViewController{
    
    NSArray *tipsArray;
    
}

@property(strong, nonatomic)IBOutlet UITableView *tipsTableView;

@end
