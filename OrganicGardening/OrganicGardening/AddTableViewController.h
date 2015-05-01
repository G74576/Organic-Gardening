//
//  AddTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/29/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTableViewController : UITableViewController{

    NSArray *gardenArray;
    NSArray *userArray;
    NSArray *sharedArray;
    NSMutableArray *combinedArray;
}

@property(strong, nonatomic)IBOutlet UITableView *gardenTable;

@end
