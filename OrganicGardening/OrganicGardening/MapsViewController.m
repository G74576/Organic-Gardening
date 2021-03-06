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
@synthesize zoneArray, mapTableView, scrollView, imgView;

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}

- (void)viewDidLoad {
    
    self.title = @"Growing Zone";
    
    zoneArray = [[NSMutableArray alloc]init];
    
    NSString *zone1 = @"Growing Zone 1";
    NSString *zone2 = @"Growing Zone 2";
    NSString *zone3 = @"Growing Zone 3";
    NSString *zone4 = @"Growing Zone 4";
    NSString *zone5 = @"Growing Zone 5";
    NSString *zone6 = @"Growing Zone 6";
    NSString *zone7 = @"Growing Zone 7";
    NSString *zone8 = @"Growing Zone 8";
    NSString *zone9 = @"Growing Zone 9";
    NSString *zone10 = @"Growing Zone 10";
    NSString *zone11 = @"Growing Zone 11";
    
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

    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plantingZone.png"]];
    self.imgView = tempImageView;
    scrollView.maximumZoomScale = 3.0; scrollView.minimumZoomScale = 0.6; scrollView.clipsToBounds = YES;
    scrollView.delegate = self; [scrollView addSubview:imgView];
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
