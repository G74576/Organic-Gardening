//
//  ZoneTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "ZoneTableViewController.h"
#import "PlantDetailViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface ZoneTableViewController ()

@end

@implementation ZoneTableViewController
@synthesize zoneCategoryInt, zoneTableView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Querey for zone1
-(void)z1Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z1" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z1 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone2
-(void)z2Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z2" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z2 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone3
-(void)z3Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z3" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z3 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone4
-(void)z4Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z4" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z4 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone5
-(void)z5Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z5" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z5 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone6
-(void)z6Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z6" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z6 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone7
-(void)z7Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z7" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z7 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone8
-(void)z8Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z8" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z8 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone9
-(void)z9Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z9" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z9 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone10
-(void)z10Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z10" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z10 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

//Querey for zone11
-(void)z11Query{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"z11" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            z11 = [[NSArray alloc]initWithArray:objects];
        }
        [zoneTableView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    if (zoneCategoryInt == 0) {
        [self performSelector:@selector(z1Query)];
    }
    else if (zoneCategoryInt == 1){
        [self performSelector:@selector(z2Query)];
    }
    else if (zoneCategoryInt == 2){
        [self performSelector:@selector(z3Query)];
    }
    else if (zoneCategoryInt == 3){
        [self performSelector:@selector(z4Query)];
    }
    else if (zoneCategoryInt == 4){
        [self performSelector:@selector(z5Query)];
    }
    else if (zoneCategoryInt == 5){
        [self performSelector:@selector(z6Query)];
    }
    else if (zoneCategoryInt == 6){
        [self performSelector:@selector(z7Query)];
    }
    else if (zoneCategoryInt == 7){
        [self performSelector:@selector(z8Query)];
    }
    else if (zoneCategoryInt == 8){
        [self performSelector:@selector(z9Query)];
    }
    else if (zoneCategoryInt == 9){
        [self performSelector:@selector(z10Query)];
    }
    else if (zoneCategoryInt == 10){
        [self performSelector:@selector(z11Query)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if (zoneCategoryInt == 0) {
        return [z1 count];
    }
    else if (zoneCategoryInt == 1){
        return [z2 count];
    }
    else if (zoneCategoryInt == 2){
        return [z3 count];
    }
    else if (zoneCategoryInt == 3){
        return [z4 count];
    }
    else if (zoneCategoryInt == 4){
        return [z5 count];
    }
    else if (zoneCategoryInt == 5){
        return [z6 count];
    }
    else if (zoneCategoryInt == 6){
        return [z7 count];
    }
    else if (zoneCategoryInt == 7){
        return [z8 count];
    }
    else if (zoneCategoryInt == 8){
        return [z9 count];
    }
    else if (zoneCategoryInt == 9){
        return [z10 count];
    }
    else if (zoneCategoryInt == 10){
        return [z11 count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZoneCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil) {
        if (zoneCategoryInt == 0) {
            self.navigationItem.title = @"Growing Zone 1";
            PFObject *z1Obj = [z1 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z1Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 1){
            self.navigationItem.title = @"Growing Zone 2";
            PFObject *z2Obj = [z2 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z2Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 2){
            self.navigationItem.title = @"Growing Zone 3";
            PFObject *z3Obj = [z3 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z3Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 3){
            self.navigationItem.title = @"Growing Zone 4";
            PFObject *z4Obj = [z4 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z4Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 4){
            self.navigationItem.title = @"Growing Zone 5";
            PFObject *z5Obj = [z5 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z5Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 5){
            self.navigationItem.title = @"Growing Zone 6";
            PFObject *z6Obj = [z6 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z6Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 6){
            self.navigationItem.title = @"Growing Zone 7";
            PFObject *z7Obj = [z7 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z7Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 7){
            self.navigationItem.title = @"Growing Zone 8";
            PFObject *z8Obj = [z8 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z8Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 8){
            self.navigationItem.title = @"Growing Zone 9";
            PFObject *z9Obj = [z9 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z9Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 9){
            self.navigationItem.title = @"Growing Zone 10";
            PFObject *z10Obj = [z10 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z10Obj objectForKey:@"name"]];
        }
        else if (zoneCategoryInt == 10){
            self.navigationItem.title = @"Growing Zone 11";
            PFObject *z11Obj = [z11 objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [z11Obj objectForKey:@"name"]];
        }
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ZoneDetail"])
    {
        NSIndexPath *indexPath = [self.zoneTableView indexPathForSelectedRow];
        PlantDetailViewController *plantDetailViewController = segue.destinationViewController;
        
        PFObject *z1Object = [z1 objectAtIndex:indexPath.row];
        PFObject *z2Object = [z2 objectAtIndex:indexPath.row];
        PFObject *z3Object = [z3 objectAtIndex:indexPath.row];
        PFObject *z4Object = [z4 objectAtIndex:indexPath.row];
        PFObject *z5Object = [z5 objectAtIndex:indexPath.row];
        PFObject *z6Object = [z6 objectAtIndex:indexPath.row];
        PFObject *z7Object = [z7 objectAtIndex:indexPath.row];
        PFObject *z8Object = [z8 objectAtIndex:indexPath.row];
        PFObject *z9Object = [z9 objectAtIndex:indexPath.row];
        PFObject *z10Object = [z10 objectAtIndex:indexPath.row];
        PFObject *z11Object = [z11 objectAtIndex:indexPath.row];
        if (plantDetailViewController != nil)
        {
            if (zoneCategoryInt == 0)
            {
                plantDetailViewController.plantObject = z1Object;
            }
            else if (zoneCategoryInt == 1)
            {
                plantDetailViewController.plantObject = z2Object;
            }
            else if (zoneCategoryInt == 2)
            {
                plantDetailViewController.plantObject = z3Object;
            }
            else if (zoneCategoryInt == 3)
            {
                plantDetailViewController.plantObject = z4Object;
            }
            else if (zoneCategoryInt == 4)
            {
                plantDetailViewController.plantObject = z5Object;
            }
            else if (zoneCategoryInt == 5)
            {
                plantDetailViewController.plantObject = z6Object;
            }
            else if (zoneCategoryInt == 6)
            {
                plantDetailViewController.plantObject = z7Object;
            }
            else if (zoneCategoryInt == 7)
            {
                plantDetailViewController.plantObject = z8Object;
            }
            else if (zoneCategoryInt == 8)
            {
                plantDetailViewController.plantObject = z9Object;
            }
            else if (zoneCategoryInt == 9)
            {
                plantDetailViewController.plantObject = z10Object;
            }
            else if (zoneCategoryInt == 10)
            {
                plantDetailViewController.plantObject = z11Object;
            }
        }
    }
}


@end
