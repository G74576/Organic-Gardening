//
//  ZoneTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantInfo.h"
#import "PlantDetailViewController.h"

@interface ZoneTableViewController : UITableViewController{
    
    NSMutableArray *z1;             //Zone 1 array
    NSMutableArray *z2;             //Zone 2 array
    NSMutableArray *z3;             //Zone 3 array
    NSMutableArray *z4;             //Zone 4 array
    NSMutableArray *z5;             //Zone 5 array
    NSMutableArray *z6;             //Zone 6 array
    NSMutableArray *z7;             //Zone 7 array
    NSMutableArray *z8;             //Zone 8 array
    NSMutableArray *z9;             //Zone 9 array
    NSMutableArray *z10;            //Zone 10 array
    NSMutableArray *z11;            //Zone 11 array

    int zoneCategoryInt;
    
}

@property(strong, nonatomic)NSMutableArray *z1;
@property(strong, nonatomic)NSMutableArray *z2;
@property(strong, nonatomic)NSMutableArray *z3;
@property(strong, nonatomic)NSMutableArray *z4;
@property(strong, nonatomic)NSMutableArray *z5;
@property(strong, nonatomic)NSMutableArray *z6;
@property(strong, nonatomic)NSMutableArray *z7;
@property(strong, nonatomic)NSMutableArray *z8;
@property(strong, nonatomic)NSMutableArray *z9;
@property(strong, nonatomic)NSMutableArray *z10;
@property(strong, nonatomic)NSMutableArray *z11;

@property(strong, nonatomic)IBOutlet UITableView *zoneTableView;

@property int zoneCategoryInt;

@end
