//
//  PlantListTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/19/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantListTableViewController.h"
#import "PlantDetailViewController.h"
#import "Reachability.h"

@interface PlantListTableViewController ()

@end

@implementation PlantListTableViewController
@synthesize plantCategoryInt, listTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//Querey for vegetables
-(void)vegeQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"category" equalTo:@"Vegetable"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            vArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Querey for fruits
-(void)fruitQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"category" equalTo:@"Fruit"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            fArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Querey for hebs
-(void)herbQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"category" equalTo:@"Herb"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            hArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Show navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    if (plantCategoryInt == 0) {
        [self performSelector:@selector(vegeQuery)];
    }
    else if (plantCategoryInt == 1){
        [self performSelector:@selector(herbQuery)];
    }
    else if (plantCategoryInt == 2){
        [self performSelector:@selector(fruitQuery)];
    }
    
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
        return [vArray count];
    }
    else if (plantCategoryInt == 1)
    {
        return [hArray count];
    }
    else if (plantCategoryInt == 2)
    {
        return [fArray count];
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
            PFObject *vegiObject = [vArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [vegiObject objectForKey:@"name"]];
        }
        else if (plantCategoryInt == 1){
            self.navigationItem.title = @"Herbs";
            PFObject *herbObject = [hArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [herbObject objectForKey:@"name"]];
        }
        else if (plantCategoryInt == 2){
            self.navigationItem.title = @"Fruits";
            PFObject *fruitObject = [fArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [fruitObject objectForKey:@"name"]];
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
        
        PFObject *vegObj = [vArray objectAtIndex:indexPath.row];
        PFObject *herObj = [hArray objectAtIndex:indexPath.row];
        PFObject *fruObj = [fArray objectAtIndex:indexPath.row];
        if (plantDetailViewController != nil)
        {
            if (plantCategoryInt == 0)
            {
                plantDetailViewController.plantObject = vegObj;
            }
            else if (plantCategoryInt == 1)
            {
                plantDetailViewController.plantObject = herObj;
            }
            else if (plantCategoryInt == 2)
            {
                plantDetailViewController.plantObject = fruObj;
            }
        }
    }
}

@end
