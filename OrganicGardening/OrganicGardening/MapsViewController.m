//
//  MapsViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "MapsViewController.h"
#import "ZoneTableViewController.h"

@interface MapsViewController ()

@end

@implementation MapsViewController
@synthesize zoneArray, mapTableView;

- (void)viewDidLoad {
    
    self.title = @"Growing Zone";
    
    zoneArray = [[NSMutableArray alloc]init];
    
    NSString *zone1 = @"Zone 1";
    NSString *zone2 = @"Zone 2";
    NSString *zone3 = @"Zone 3";
    NSString *zone4 = @"Zone 4";
    NSString *zone5 = @"Zone 5";
    NSString *zone6 = @"Zone 6";
    NSString *zone7 = @"Zone 7";
    NSString *zone8 = @"Zone 8";
    NSString *zone9 = @"Zone 9";
    NSString *zone10 = @"Zone 10";
    NSString *zone11 = @"Zone 11";
    
    [zoneArray addObject:zone1];
    [zoneArray addObject:zone2];
    [zoneArray addObject:zone3];
    [zoneArray addObject:zone4];
    [zoneArray addObject:zone5];
    [zoneArray addObject:zone6];
    [zoneArray addObject:zone7];
    [zoneArray addObject:zone8];
    [zoneArray addObject:zone9];
    [zoneArray addObject:zone10];
    [zoneArray addObject:zone11];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Show navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [zoneArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [mapTableView dequeueReusableCellWithIdentifier:@"MapCell" forIndexPath:indexPath];
    
    if (cell != nil){
        cell.textLabel.text = [zoneArray objectAtIndex:indexPath.row];
    }
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"MapDetail"])
    {
        NSIndexPath *indexPath = [self.mapTableView indexPathForSelectedRow];
        ZoneTableViewController *zoneTableViewController = segue.destinationViewController;
        
        if (zoneTableViewController != nil)
        {
            if ([indexPath row] == 0)
            {
                zoneTableViewController.zoneCategoryInt = 1;
            }
            else if ([indexPath row] == 1)
            {
                zoneTableViewController.zoneCategoryInt = 2;
            }
            else if ([indexPath row] ==2)
            {
                zoneTableViewController.zoneCategoryInt = 3;
            }
            else if ([indexPath row] ==3)
            {
                zoneTableViewController.zoneCategoryInt = 4;
            }
            else if ([indexPath row] == 4)
            {
                zoneTableViewController.zoneCategoryInt = 5;
            }
            else if ([indexPath row] == 5)
            {
                zoneTableViewController.zoneCategoryInt = 6;
            }
            else if ([indexPath row] == 6)
            {
                zoneTableViewController.zoneCategoryInt = 7;
            }
            else if ([indexPath row] == 7)
            {
                zoneTableViewController.zoneCategoryInt = 8;
            }
            else if ([indexPath row] == 8)
            {
                zoneTableViewController.zoneCategoryInt = 9;
            }
            else if ([indexPath row] == 9)
            {
                zoneTableViewController.zoneCategoryInt = 10;
            }
            else if ([indexPath row] == 10)
            {
                zoneTableViewController.zoneCategoryInt = 11;
            }
        }
    }
}


@end
