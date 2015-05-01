//
//  MyGardenTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/24/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "MyGardenTableViewController.h"
#import "MyGardenDetailViewController.h"

@interface MyGardenTableViewController ()

@property (strong, nonatomic) NSArray *plantArray;

@end

@implementation MyGardenTableViewController
@synthesize gardenTable, plantArray;

- (void)viewDidLoad {
    
    self.title = @"My Garden";
    
    [super viewDidLoad];
    

}


//Querying parse for all items added to the users garden
- (void)gardenQuery{
    
    PFQuery *query = [PFQuery queryWithClassName:@"MyGarden"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    [query orderByAscending:@"mgName"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            gardenArray = [[NSArray alloc] initWithArray:objects];
        }
        [gardenTable reloadData];
    }];
}

- (void)plantQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            plantArray = [[NSArray alloc]initWithArray:objects];
        }
    }];
}

//Refresh view
-(void)refreshTableData{
    [self viewDidLoad];
    [self viewWillAppear:YES];
}

//If edit button in navigation bar is pressed:
- (void)editBarBtnPressed:(id)sender{
    
//    if ([gardenTable isEditing]) {
//        [self.editBtn setTitle:@"Edit"];
//        [gardenTable setEditing:NO animated:YES];
//    }
//    else {
//        [self.editBtn setTitle:@"Done"];
//        [gardenTable setEditing:YES animated:YES];
//    }
}


//Show navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser]) {
        
        [self performSelector:@selector(gardenQuery)];
    } else {
        
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
    return gardenArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GardenCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil)
    {
        PFObject *gardenObject = [gardenArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [gardenObject objectForKey:@"mgName"];
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        PFObject *object = gardenArray[indexPath.row];
        [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            UIView *parent = self.view.superview;
//            [self.view removeFromSuperview];
//            self.view = nil;
//            [parent addSubview:self.view];
            
        }];
        [self performSelectorOnMainThread:@selector(refreshTableData) withObject:nil waitUntilDone:NO];
        [gardenTable reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
    if ([segue.identifier isEqualToString:@"GardenDetails"]) {
        NSIndexPath *indexPath = [self.gardenTable indexPathForSelectedRow];
        MyGardenDetailViewController *dvc = segue.destinationViewController;
        
        PFObject *garden = [gardenArray objectAtIndex:indexPath.row];
        if (dvc != nil) {
            dvc.gardenObject = garden;
        }
        
    }
}


@end
