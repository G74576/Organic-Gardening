//
//  MapsViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *zoneArray;      //Array of zone numbers for table
    
}

@property(strong, nonatomic)IBOutlet UITableView *mapTableView;

@property(strong, nonatomic)NSMutableArray *zoneArray;

@end
