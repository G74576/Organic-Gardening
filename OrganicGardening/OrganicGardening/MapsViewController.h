//
//  MapsViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate> {
    
    NSMutableArray *zoneArray;      //Array of zone numbers for table
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIImageView *imgView;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *imgView;

@property(strong, nonatomic)IBOutlet UITableView *mapTableView;

@property(strong, nonatomic)NSMutableArray *zoneArray;

@end
