//
//  PlantListTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/19/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDetailViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface PlantListTableViewController : UITableViewController{
    
    //Organic Gardening Arrays
    NSArray *vArray;
    NSArray *hArray;
    NSArray *fArray;
    
    //Current User Arrays
    NSArray *cvArray;
    NSArray *chArray;
    NSArray *cfArray;
    
    //Users who shared Arrays
    NSArray *svArray;
    NSArray *shArray;
    NSArray *sfArray;
    
    int plantCategoryInt;               //Used to know which category is selected from the home screen
    
}

@property(strong, nonatomic)IBOutlet UITableView *listTableView;

@property int plantCategoryInt;

@end
