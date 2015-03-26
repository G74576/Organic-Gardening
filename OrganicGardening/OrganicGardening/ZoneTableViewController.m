//
//  ZoneTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/22/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "ZoneTableViewController.h"
#import "PlantDetailViewController.h"
#import "PlantInfo.h"

@interface ZoneTableViewController ()

@end

@implementation ZoneTableViewController
@synthesize zoneCategoryInt, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, zoneTableView;

- (void)viewDidLoad {
    
    z1 = [[NSMutableArray alloc]init];
    
    PlantInfo *carrots = [[PlantInfo alloc]initWithTitle:@"Carrots" pZone:1];
    PlantInfo *cucumbers = [[PlantInfo alloc]initWithTitle:@"Cucumbers" pZone:1];
    
    [z1 addObject:carrots];
    [z1 addObject:cucumbers];
    
    z2 = [[NSMutableArray alloc]init];
    
    PlantInfo *lettuce = [[PlantInfo alloc]initWithTitle:@"Lettuce" pZone:2];
    PlantInfo *peas = [[PlantInfo alloc]initWithTitle:@"Peas" pZone:2];
    
    [z2 addObject:lettuce];
    [z2 addObject:peas];
    
    z3 = [[NSMutableArray alloc]init];
    
    PlantInfo *basil = [[PlantInfo alloc]initWithTitle:@"Basil" pZone:3];
    PlantInfo *dill = [[PlantInfo alloc]initWithTitle:@"Dill" pZone:3];
    
    [z3 addObject:basil];
    [z3 addObject:dill];
    
    z4 = [[NSMutableArray alloc]init];
    
    PlantInfo *mint = [[PlantInfo alloc]initWithTitle:@"Mint" pZone:4];
    PlantInfo *oregano = [[PlantInfo alloc]initWithTitle:@"Oregano" pZone:4];

    [z4 addObject:mint];
    [z4 addObject:oregano];
    
    z5 = [[NSMutableArray alloc]init];
    
    PlantInfo *parsley = [[PlantInfo alloc]initWithTitle:@"Parsley" pZone:5];
    
    [z5 addObject:parsley];
    
    z6 = [[NSMutableArray alloc] init];
    
    PlantInfo *blueberry = [[PlantInfo alloc]initWithTitle:@"Blueberrys" pZone:6];
    
    [z6 addObject:blueberry];
    
    z7 = [[NSMutableArray alloc]init];
    
    PlantInfo *melon = [[PlantInfo alloc]initWithTitle:@"Melon" pZone:7];

    [z7 addObject:melon];
    
    z8 = [[NSMutableArray alloc]init];
    
    PlantInfo *rasp = [[PlantInfo alloc]initWithTitle:@"Raspberrys" pZone:8];

    [z8 addObject:rasp];
    
    z9 = [[NSMutableArray alloc]init];
    
    PlantInfo *straw = [[PlantInfo alloc]initWithTitle:@"Strawberrys" pZone:9];

    [z9 addObject:straw];
    
    z10 = [[NSMutableArray alloc]init];
    
    PlantInfo *water = [[PlantInfo alloc]initWithTitle:@"Watermelon" pZone:10];
    
    [z10 addObject:water];
    
    z11 = [[NSMutableArray alloc]init];
    
    PlantInfo *eggplant = [[PlantInfo alloc]initWithTitle:@"Eggplant" pZone:1];
    
    [z11 addObject:eggplant];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
            PlantInfo *plantInfo = [z1 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 1){
            self.navigationItem.title = @"Growing Zone 2";
            PlantInfo *plantInfo = [z2 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 2){
            self.navigationItem.title = @"Growing Zone 3";
            PlantInfo *plantInfo = [z3 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 3){
            self.navigationItem.title = @"Growing Zone 4";
            PlantInfo *plantInfo = [z4 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 4){
            self.navigationItem.title = @"Growing Zone 5";
            PlantInfo *plantInfo = [z5 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 5){
            self.navigationItem.title = @"Growing Zone 6";
            PlantInfo *plantInfo = [z6 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 6){
            self.navigationItem.title = @"Growing Zone 7";
            PlantInfo *plantInfo = [z7 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 7){
            self.navigationItem.title = @"Growing Zone 8";
            PlantInfo *plantInfo = [z8 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 8){
            self.navigationItem.title = @"Growing Zone 9";
            PlantInfo *plantInfo = [z9 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 9){
            self.navigationItem.title = @"Growing Zone 10";
            PlantInfo *plantInfo = [z10 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (zoneCategoryInt == 10){
            self.navigationItem.title = @"Growing Zone 11";
            PlantInfo *plantInfo = [z11 objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
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
        
        if (plantDetailViewController != nil)
        {
            if (zoneCategoryInt == 0)
            {
                PlantInfo *z1Info = [z1 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z1Info;
            }
            else if (zoneCategoryInt == 1)
            {
                PlantInfo *z2Info = [z2 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z2Info;
            }
            else if (zoneCategoryInt == 2)
            {
                PlantInfo *z3Info = [z3 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z3Info;
            }
            else if (zoneCategoryInt == 3)
            {
                PlantInfo *z4Info = [z4 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z4Info;
            }
            else if (zoneCategoryInt == 4)
            {
                PlantInfo *z5Info = [z5 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z5Info;
            }
            else if (zoneCategoryInt == 5)
            {
                PlantInfo *z6Info = [z6 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z6Info;
            }
            else if (zoneCategoryInt == 6)
            {
                PlantInfo *z7Info = [z7 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z7Info;
            }
            else if (zoneCategoryInt == 7)
            {
                PlantInfo *z8Info = [z8 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z8Info;
            }
            else if (zoneCategoryInt == 8)
            {
                PlantInfo *z9Info = [z9 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z9Info;
            }
            else if (zoneCategoryInt == 9)
            {
                PlantInfo *z10Info = [z10 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z10Info;
            }
            else if (zoneCategoryInt == 10)
            {
                PlantInfo *z11Info = [z11 objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = z11Info;
            }
        }
    }
}


@end
