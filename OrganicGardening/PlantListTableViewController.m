//
//  PlantListTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/19/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantListTableViewController.h"
#import "PlantDetailViewController.h"
#import "PlantInfo.h"

@interface PlantListTableViewController ()

@end

@implementation PlantListTableViewController
@synthesize plantCategoryInt, listTableView, vegiArray, herbArray, fruitArray;

- (void)viewDidLoad {
    
    vegiArray = [[NSMutableArray alloc]init];
    
    PlantInfo *carrots = [[PlantInfo alloc]initWithTitle:@"Carrots" pZone:1];
    PlantInfo *cucumbers = [[PlantInfo alloc]initWithTitle:@"Cucumbers" pZone:1];
    PlantInfo *eggplant = [[PlantInfo alloc]initWithTitle:@"Eggplant" pZone:1];
    PlantInfo *lettuce = [[PlantInfo alloc]initWithTitle:@"Lettuce" pZone:1];
    PlantInfo *peas = [[PlantInfo alloc]initWithTitle:@"Peas" pZone:1];
    
    [vegiArray addObject:carrots];
    [vegiArray addObject:cucumbers];
    [vegiArray addObject:eggplant];
    [vegiArray addObject:lettuce];
    [vegiArray addObject:peas];
    
    herbArray = [[NSMutableArray alloc]init];
    
    PlantInfo *basil = [[PlantInfo alloc]initWithTitle:@"Basil" pZone:2];
    PlantInfo *dill = [[PlantInfo alloc]initWithTitle:@"Dill" pZone:2];
    PlantInfo *mint = [[PlantInfo alloc]initWithTitle:@"Mint" pZone:2];
    PlantInfo *oregano = [[PlantInfo alloc]initWithTitle:@"Oregano" pZone:2];
    PlantInfo *parsley = [[PlantInfo alloc]initWithTitle:@"Parsley" pZone:2];
    
    [herbArray addObject:basil];
    [herbArray addObject:dill];
    [herbArray addObject:mint];
    [herbArray addObject:oregano];
    [herbArray addObject:parsley];
    
    fruitArray = [[NSMutableArray alloc] init];
    
    PlantInfo *blueberry = [[PlantInfo alloc]initWithTitle:@"Blueberrys" pZone:3];
    PlantInfo *melon = [[PlantInfo alloc]initWithTitle:@"Melon" pZone:3];
    PlantInfo *rasp = [[PlantInfo alloc]initWithTitle:@"Raspberrys" pZone:3];
    PlantInfo *straw = [[PlantInfo alloc]initWithTitle:@"Strawberrys" pZone:3];
    PlantInfo *water = [[PlantInfo alloc]initWithTitle:@"Watermelon" pZone:3];
    
    [fruitArray addObject:blueberry];
    [fruitArray addObject:melon];
    [fruitArray addObject:rasp];
    [fruitArray addObject:straw];
    [fruitArray addObject:water];
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (plantCategoryInt == 0)
    {
        return [vegiArray count];
    }
    else if (plantCategoryInt == 1)
    {
        return [herbArray count];
    }
    else if (plantCategoryInt == 2)
    {
        return [fruitArray count];
    }
    [self.listTableView reloadData];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [listTableView dequeueReusableCellWithIdentifier:@"PlantCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil) {
        if (plantCategoryInt == 0) {
            self.navigationItem.title = @"Vegetables";
            PlantInfo *plantInfo = [vegiArray objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (plantCategoryInt == 1){
            self.navigationItem.title = @"Herbs";
            PlantInfo *plantInfo = [herbArray objectAtIndex:indexPath.row];
            cell.textLabel.text = plantInfo.plantName;
        }
        else if (plantCategoryInt == 2){
            self.navigationItem.title = @"Fruits";
            PlantInfo *plantInfo = [fruitArray objectAtIndex:indexPath.row];
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
    if ([segue.identifier isEqualToString:@"PlantDetails"])
    {
        NSIndexPath *indexPath = [self.listTableView indexPathForSelectedRow];
        PlantDetailViewController *plantDetailViewController = segue.destinationViewController;
        
        if (plantDetailViewController != nil)
        {
            if (plantCategoryInt == 0)
            {
                PlantInfo *vegiInfo = [vegiArray objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = vegiInfo;
            }
            else if (plantCategoryInt == 1)
            {
                PlantInfo *herbInfo = [herbArray objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = herbInfo;
            }
            else if (plantCategoryInt == 2)
            {
                PlantInfo *fruitInfo = [fruitArray objectAtIndex:indexPath.row];
                plantDetailViewController.pInfo = fruitInfo;
            }
        }
    }
}

@end
