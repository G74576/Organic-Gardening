//
//  TipsTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsTableViewController : UITableViewController{
    
    NSMutableArray *tipsArray;      //Tips and Tricks array
    
}

@property(strong, nonatomic)IBOutlet UITableView *tipsTableView;

@property(strong, nonatomic)NSMutableArray *tipsArray;

@end
