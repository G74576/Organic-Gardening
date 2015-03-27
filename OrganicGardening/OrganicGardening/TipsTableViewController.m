//
//  TipsTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "TipsTableViewController.h"
#import "TipsInfo.h"
#import "TipsDetailViewController.h"

@interface TipsTableViewController ()

@end

@implementation TipsTableViewController
@synthesize tipsTableView, tipsArray;

- (void)viewDidLoad {
    
    self.title = @"Tips & Tricks";
    
    tipsArray = [[NSMutableArray alloc]init];
    
    TipsInfo *tip1 = [[TipsInfo alloc]initWithTitle:@"Tip #1"];
    TipsInfo *tip2 = [[TipsInfo alloc]initWithTitle:@"Tip #2"];
    TipsInfo *tip3 = [[TipsInfo alloc]initWithTitle:@"Tip #3"];
    TipsInfo *tip4 = [[TipsInfo alloc]initWithTitle:@"Tip #4"];
    TipsInfo *tip5 = [[TipsInfo alloc]initWithTitle:@"Tip #5"];
    
    [tipsArray addObject:tip1];
    [tipsArray addObject:tip2];
    [tipsArray addObject:tip3];
    [tipsArray addObject:tip4];
    [tipsArray addObject:tip5];
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return tipsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil) {
        TipsInfo *tipsInfo = [tipsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = tipsInfo.tipsName;
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

//    if ([segue.identifier isEqualToString:@"TipsDetail"])
//    {
//        NSIndexPath *indexPath = [self.tipsTableView indexPathForSelectedRow];
//        TipsDetailViewController *tipsDetailViewController = segue.destinationViewController;
//        
//        if (tipsDetailViewController != nil)
//        {
//            TipsInfo *tipsInfo = [tipsArray objectAtIndex:indexPath.row];
//            tipsDetailViewController.tInfo = tipsInfo;
//        }
//    }
}

@end
