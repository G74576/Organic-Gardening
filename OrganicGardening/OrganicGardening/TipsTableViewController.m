//
//  TipsTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/25/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "TipsTableViewController.h"
#import "TipsDetailViewController.h"

@interface TipsTableViewController ()

@end

@implementation TipsTableViewController
@synthesize tipsTableView;

- (void)viewDidLoad {
    
    self.title = @"Tips & Tricks";

    
    [super viewDidLoad];
}

//Query list of tips from Parse.com
- (void)tipsQuery{
    
    PFQuery *query = [PFQuery queryWithClassName:@"TipsTricks"];
    [query whereKey:@"user" equalTo:[PFUser currentUser]];
    [query orderByAscending:@"tipName"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            tipsArray = [[NSArray alloc] initWithArray:objects];
        }
        [tipsTableView reloadData];
    }];
}

//Show navigation bar on this scene
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser]) {
        [self performSelector:@selector(tipsQuery)];
    }else {
    
    }
}

//Refresh table
-(void)refreshTableData{
    [self viewDidLoad];
    [self viewWillAppear:YES];
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
        PFObject *tipObject = [tipsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [tipObject objectForKey:@"tipName"];
    }
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//     Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PFObject *object = tipsArray[indexPath.row];
        [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                        UIView *parent = self.view.superview;
//                        [self.view removeFromSuperview];
//                        self.view = nil;
//                        [parent addSubview:self.view];
            
        }];
        [self performSelectorOnMainThread:@selector(refreshTableData) withObject:nil waitUntilDone:NO];
        [tipsTableView reloadData];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
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

    if ([segue.identifier isEqualToString:@"TipsDetail"])
    {
        NSIndexPath *indexPath = [self.tipsTableView indexPathForSelectedRow];
        TipsDetailViewController *tipsDetailViewController = segue.destinationViewController;
        
        PFObject *tip = [tipsArray objectAtIndex:indexPath.row];
        if (tipsDetailViewController != nil)
        {
            tipsDetailViewController.tipsObject = tip;
        }
    }
}

@end
