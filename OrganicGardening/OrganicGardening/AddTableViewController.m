//
//  AddTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/29/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "AddTableViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "MyGardenTableViewController.h"

@interface AddTableViewController ()

@end

@implementation AddTableViewController
@synthesize gardenTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

//Querey for Organic Gardening plants
-(void)ogQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            gardenArray = [[NSArray alloc]initWithArray:objects];
        }
        [gardenTable reloadData];
    }];
}

//Query for Current User plants
-(void)userQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"UsersPlants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" equalTo:user];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            userArray = [[NSArray alloc]initWithArray:objects];
        }
        [gardenTable reloadData];
    }];
}

//Query for Shared plants
-(void)shareQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"UsersPlants"];
    PFUser *user = [PFUser currentUser];
    [query whereKey:@"user" notEqualTo:user];
    [query whereKey:@"share" equalTo:[NSNumber numberWithBool:YES]];
    [query orderByAscending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            sharedArray = [[NSArray alloc]initWithArray:objects];
        }
        [gardenTable reloadData];
    }];
}

//Show navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    [self performSelector:@selector(ogQuery)];
    [self performSelector:@selector(userQuery)];
    [self performSelector:@selector(shareQuery)];

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
    return [gardenArray count] + [userArray count] + [sharedArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddGardenQuery" forIndexPath:indexPath];
    
    if (cell != nil) {
        PFObject *obj = [combinedArray objectAtIndex:indexPath.row];
        combinedArray = [[NSMutableArray alloc]init];
        [combinedArray addObjectsFromArray:gardenArray];
        [combinedArray addObjectsFromArray:userArray];
        [combinedArray addObjectsFromArray:sharedArray];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [obj objectForKey:@"name"]];
    }
    
    return cell;
}

-(void)displayVC{
    MyGardenTableViewController *myGV = [[MyGardenTableViewController alloc]init];
    [myGV.view setBackgroundColor:[UIColor clearColor]];
    [self.navigationController pushViewController:myGV animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Add"])
    {
        NSIndexPath *indexPath = [self.gardenTable indexPathForSelectedRow];
        
        PFUser *user = [PFUser currentUser];
        
        PFObject *postEvent = [PFObject objectWithClassName:@"MyGarden"];
        
        PFObject *obj;
        
        obj = [combinedArray objectAtIndex:indexPath.row];
        
        postEvent[@"mgName"] = [obj objectForKeyedSubscript:@"name"];
        postEvent[@"mgImage"] = [obj objectForKeyedSubscript:@"image"];
        
        //Set Plant Date:
        NSDate *plantDate = [NSDate date];
        NSDateFormatter *form = [[NSDateFormatter alloc]init];
        [form setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *plantDateString = [form stringFromDate:plantDate];
        
        postEvent[@"plantDate"] = plantDateString;
        
        //Set Germination Date:
        NSString *germString = [NSString stringWithFormat:@"%@", [obj objectForKey:@"germDate"]];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *germNumber = [f numberFromString:germString];
        int numb = [germNumber intValue];
        NSDate *now = [NSDate date];
        NSDate *newDate1 = [now dateByAddingTimeInterval:60*60*24*numb];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDate = [formatter stringFromDate:newDate1];
        //NSLog(@"%@", stringFromDate);
        
        postEvent[@"germDate"] = stringFromDate;
        
        //Set Transplant Date:
        NSString *tranString = [NSString stringWithFormat:@"%@", [obj objectForKey:@"tranDate"]];
        NSNumberFormatter *fo = [[NSNumberFormatter alloc] init];
        [fo setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *tranNumber = [fo numberFromString:tranString];
        int tNumb = [tranNumber intValue];
        NSDate *nowA = [NSDate date];
        NSDate *newDate2 = [nowA dateByAddingTimeInterval:60*60*24*tNumb];
        NSDateFormatter *formatterA = [[NSDateFormatter alloc] init];
        [formatterA setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDateA = [formatterA stringFromDate:newDate2];
        //NSLog(@"%@", stringFromDateA);
        
        postEvent[@"tranDate"] = stringFromDateA;
        
        //Set Harvest Date:
        NSString *harvString = [NSString stringWithFormat:@"%@", [obj objectForKey:@"harvDate"]];
        NSNumberFormatter *f1 = [[NSNumberFormatter alloc] init];
        [f1 setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *harvNumb = [f1 numberFromString:harvString];
        int hNumb = [harvNumb intValue];
        NSDate *nowB = [NSDate date];
        NSDate *newDate3 = [nowB dateByAddingTimeInterval:60*60*24*hNumb];
        NSDateFormatter *formatterB = [[NSDateFormatter alloc] init];
        [formatterB setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDateB = [formatter stringFromDate:newDate3];
        //NSLog(@"%@", stringFromDateB);
        
        postEvent[@"harvDate"] = stringFromDateB;
        
        postEvent[@"user"] = user;
        [postEvent save];
        UIView *parent = self.view.superview;
        [self.view removeFromSuperview];
        self.view = nil;
        [parent addSubview:self.view];
        
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Added To %@ Your Garden", [obj objectForKey:@"name"]]
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


@end
