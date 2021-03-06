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
@synthesize plantCategoryInt, listTableView ;


- (void)viewDidLoad {
    [super viewDidLoad];

}

//Querey for Organic Gardening vegetables
-(void)vegeQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"ogBool" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Vegetable"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            vArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Querey for Organic Gardening fruits
-(void)fruitQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"ogBool" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Fruit"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            fArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Querey for Organic Gardening hebs
-(void)herbQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"ogBool" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Herb"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            hArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Current User Vegetables
-(void)cvegeQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query whereKey:@"category" equalTo:@"Vegetable"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            cvArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Current User Herbs
-(void)cherbQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query whereKey:@"category" equalTo:@"Herb"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            chArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Current User Fruits
-(void)cfruitQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query whereKey:@"category" equalTo:@"Fruit"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            cfArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Shared Vegetables
-(void)svegeQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" notEqualTo:user];
    [query whereKey:@"share" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Vegetable"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            svArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Shared Herbs
-(void)sherbQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" notEqualTo:user];
    [query whereKey:@"share" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Herb"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            shArray = [[NSArray alloc]initWithArray:objects];
        }
        [listTableView reloadData];
    }];
}

//Query for Shared Fruits
-(void)sfruitQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"UsersPlants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" notEqualTo:user];
    [query whereKey:@"share" equalTo:[NSNumber numberWithBool:YES]];
    [query whereKey:@"category" equalTo:@"Fruit"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            sfArray = [[NSArray alloc]initWithArray:objects];
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
        [self performSelector:@selector(cvegeQuery)];
        [self performSelector:@selector(svegeQuery)];
    }
    else if (plantCategoryInt == 1){
        [self performSelector:@selector(herbQuery)];
        [self performSelector:@selector(cherbQuery)];
        [self performSelector:@selector(sherbQuery)];
    }
    else if (plantCategoryInt == 2){
        [self performSelector:@selector(fruitQuery)];
        [self performSelector:@selector(cfruitQuery)];
        [self performSelector:@selector(sfruitQuery)];
    }
    
}

//Displays an alert the virst time the user clicks on either veg/herb/frut category letting them know they can add their own items to the list.
- (void) displayAddAlert
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *alreadyRun = @"already-run";
    if ([prefs boolForKey:alreadyRun])
        return;
    [prefs setBool:YES forKey:alreadyRun];
    UIAlertView *addToGarden = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"If you have a plant that is not on the list, but would like to add it, click the 'Add' button in the top right corner of the screen."] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [addToGarden show];
}

-(void)viewDidAppear:(BOOL)animated{
    [self displayAddAlert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (plantCategoryInt == 0)
    {
        if (section == 0) {
            return [vArray count];
        }
        else if (section == 1) {
            return [cvArray count];
        }
        else if (section == 2) {
            return [svArray count];
        }
        
    }
    else if (plantCategoryInt == 1)
    {
        if (section == 0) {
            return [hArray count];
        }
        else if (section == 1) {
            return [chArray count];
        }
        else if (section == 2) {
            return [shArray count];
        }
        
    }
    else if (plantCategoryInt == 2)
    {
        if (section == 0) {
            return [fArray count];
        }
        else if (section == 1) {
            return [cfArray count];
        }
        else if (section == 2) {
            return [sfArray count];
        }
    }
    [self.listTableView reloadData];
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (plantCategoryInt == 0) {
        switch (section) {
            case 0:
                return @"Organic Gardening Vegetables";
                break;
            case 1:
                return @"Your Added Vegetables";
                break;
            case 2:
                return @"Other Users Shared Vegeatables";
                break;
            default:
                break;
        }
    }
    if (plantCategoryInt == 1) {
        switch (section) {
            case 0:
                return @"Organic Gardening Herbs";
                break;
            case 1:
                return @"Your Added Herbs";
                break;
            case 2:
                return @"Other Users Shared Herbs";
                break;
            default:
                break;
        }
    }
    if (plantCategoryInt == 2) {
        switch (section) {
            case 0:
                return @"Organic Gardening Fruits";
                break;
            case 1:
                return @"Your Added Fruits";
                break;
            case 2:
                return @"Other Users Shared Fruits";
                break;
            default:
                break;
        }
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *)view;
    tableViewHeaderFooterView.textLabel.font = [UIFont fontWithName:@"Arial" size:16.0f];
    tableViewHeaderFooterView.textLabel.textColor = [UIColor whiteColor];
    tableViewHeaderFooterView.contentView.backgroundColor = [UIColor colorWithRed:0.459 green:0.298 blue:0.141 alpha:1]; /*#754c24*/
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [listTableView dequeueReusableCellWithIdentifier:@"PlantCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil) {
        if (plantCategoryInt == 0) {
            self.navigationItem.title = @"Vegetables";
            
            if (indexPath.section == 0) {
                PFObject *vegiObject = [vArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [vegiObject objectForKey:@"name"]];
            }
            if (indexPath.section == 1) {
                PFObject *cvegiObject = [cvArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [cvegiObject objectForKey:@"name"]];
            }
            if (indexPath.section == 2) {
                PFObject *svegiObject = [svArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [svegiObject objectForKey:@"name"]];
            }

        }
        else if (plantCategoryInt == 1){
            self.navigationItem.title = @"Herbs";
            if (indexPath.section == 0) {
                PFObject *herbObject = [hArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [herbObject objectForKey:@"name"]];
            }
            if (indexPath.section == 1) {
                PFObject *cherbObject = [chArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [cherbObject objectForKey:@"name"]];
            }
            if (indexPath.section == 2) {
                PFObject *sherbObject = [shArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [sherbObject objectForKey:@"name"]];
            }

        }
        else if (plantCategoryInt == 2){
            self.navigationItem.title = @"Fruits";
            if (indexPath.section == 0) {
                PFObject *fruitObject = [fArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [fruitObject objectForKey:@"name"]];
            }
            if (indexPath.section == 1) {
                PFObject *cfruitObject = [cfArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [cfruitObject objectForKey:@"name"]];
            }
            if (indexPath.section == 2) {
                PFObject *sfruitObject = [sfArray objectAtIndex:indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@", [sfruitObject objectForKey:@"name"]];
            }
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
        NSUInteger selectedSection = indexPath.section;
        PlantDetailViewController *plantDetailViewController = segue.destinationViewController;
        
        PFObject *vegObj;
        PFObject *herObj;
        PFObject *fruObj;
        
        if (plantCategoryInt == 0)
        {
            if (selectedSection == 0) {
                vegObj = [vArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 1) {
                vegObj = [cvArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 2) {
                vegObj = [svArray objectAtIndex:indexPath.row];
            }
            
        }
        else if (plantCategoryInt == 1)
        {
            if (selectedSection == 0) {
                herObj = [hArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 1) {
                herObj = [chArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 2) {
                herObj = [shArray objectAtIndex:indexPath.row];
            }
        }
        else if (plantCategoryInt == 2)
        {
            if (selectedSection == 0) {
                fruObj = [fArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 1) {
                fruObj = [cfArray objectAtIndex:indexPath.row];
            }
            if (selectedSection == 2) {
                fruObj = [sfArray objectAtIndex:indexPath.row];
            }
        }

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
