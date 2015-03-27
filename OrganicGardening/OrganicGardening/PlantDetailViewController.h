//
//  PlantDetailViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantInfo.h"
#import "PlantListTableViewController.h"

@interface PlantDetailViewController : UIViewController<UIAlertViewDelegate>{
    
    IBOutlet UIScrollView *scrollView;
    
}

@property (strong, nonatomic)PlantInfo *pInfo;

-(IBAction)addToGarden:(id)sender;

@end
