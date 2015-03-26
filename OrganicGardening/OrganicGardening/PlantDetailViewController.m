//
//  PlantDetailViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantDetailViewController.h"
#import "PlantListTableViewController.h"
#import "PlantInfo.h"
#import <Parse/Parse.h>

@interface PlantDetailViewController ()

@end

@implementation PlantDetailViewController
@synthesize pInfo;

- (void)viewDidLoad {

    self.title = pInfo.plantName;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addToGarden:(id)sender{
    PFUser *user = [PFUser currentUser];
    
    PFObject *postEvent = [PFObject objectWithClassName:@"MyGarden"];
    
    postEvent[@"mgName"] = pInfo.plantName;
    
    postEvent[@"user"] = user;
    [postEvent save];
    UIView *parent = self.view.superview;
    [self.view removeFromSuperview];
    self.view = nil;
    [parent addSubview:self.view];
    
    [[[UIAlertView alloc] initWithTitle:@"Add To My Garden"
                                message:@"Added to your personal garden!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
