//
//  FirstViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/17/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "FirstViewController.h"
#import "PlantListTableViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Set appearance of title for navigation bar.
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Apple-Chancery" size:30.0], NSFontAttributeName, nil]];

}


//Hide navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:animated];
}


////Unhide naviagtion bar when this scene ends
//- (void)viewDidDisappear: (BOOL)animated
//{
//    //animated = false;
//    [self.navigationController setNavigationBarHidden:NO];
//    [super viewDidDisappear:animated];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PlantListTableViewController *ptvc = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"VegiesSegue"])
    {
        ptvc.plantCategoryInt = 0;
    }
    else if ([segue.identifier isEqualToString:@"HerbsSegue"])
    {
        ptvc.plantCategoryInt = 1;
    }
    else if ([segue.identifier isEqualToString:@"FruitsSegue"])
    {
        ptvc.plantCategoryInt = 2;
    }
}

@end
