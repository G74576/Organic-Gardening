//
//  ZoneTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDetailViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface ZoneTableViewController : UITableViewController{
    
    NSArray *z1;             //Zone 1 array
    NSArray *z2;             //Zone 2 array
    NSArray *z3;             //Zone 3 array
    NSArray *z4;             //Zone 4 array
    NSArray *z5;             //Zone 5 array
    NSArray *z6;             //Zone 6 array
    NSArray *z7;             //Zone 7 array
    NSArray *z8;             //Zone 8 array
    NSArray *z9;             //Zone 9 array
    NSArray *z10;            //Zone 10 array
    NSArray *z11;            //Zone 11 array

    int zoneCategoryInt;
    
}

@property(strong, nonatomic)IBOutlet UITableView *zoneTableView;

@property int zoneCategoryInt;

@end
