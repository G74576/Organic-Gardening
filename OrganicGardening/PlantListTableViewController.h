//
//  PlantListTableViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/19/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDetailViewController.h"
#import "PlantInfo.h"

@interface PlantListTableViewController : UITableViewController{
    
    NSMutableArray *vegiArray;          //Vegetable list array
    NSMutableArray *herbArray;          //Herbs list array
    NSMutableArray *fruitArray;         //Fruit list arrray
    
    int plantCategoryInt;               //Used to know which category is selected from the home screen
    
}

@property(strong, nonatomic)IBOutlet UITableView *listTableView;

@property(strong, nonatomic)NSMutableArray *vegiArray;
@property(strong, nonatomic)NSMutableArray *herbArray;
@property(strong, nonatomic)NSMutableArray *fruitArray;

@property int plantCategoryInt;

@end
