//
//  PlantListTableViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/19/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantListTableViewController.h"

@interface PlantListTableViewController ()

@end

@implementation PlantListTableViewController
@synthesize plantCategoryInt, listTableView, vegiArray, herbArray, fruitArray, titleLabel;

- (void)viewDidLoad {
    
    vegiArray = [[NSMutableArray alloc]init];
    
    NSString *carrots = @"Carrots";
    NSString *cucumbers = @"Cucumbers";
    NSString *eggplant = @"Eggplant";
    NSString *lettuce = @"Lettuce";
    NSString *peas = @"Peas";
    
    [vegiArray addObject:carrots];
    [vegiArray addObject:cucumbers];
    [vegiArray addObject:eggplant];
    [vegiArray addObject:lettuce];
    [vegiArray addObject:peas];
    
    herbArray = [[NSMutableArray alloc]init];
    
    NSString *basil = @"Basil";
    NSString *dill = @"Dill";
    NSString *mint = @"Mint";
    NSString *oregano = @"Oregano";
    NSString *parseley = @"Parsley";
    
    [herbArray addObject:basil];
    [herbArray addObject:dill];
    [herbArray addObject:mint];
    [herbArray addObject:oregano];
    [herbArray addObject:parseley];
    
    fruitArray = [[NSMutableArray alloc] init];
    
    NSString *blueberry =@"Blueberrys";
    NSString *melon = @"Melon";
    NSString *rasp = @"Raspberrys";
    NSString *straw = @"Strawberrys";
    NSString *water = @"Watermelon";
    
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

//Hide navigation bar on this scene
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
    [self.tableView reloadData];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlantCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell != nil) {
        if (plantCategoryInt == 0) {
            self.navigationItem.title = @"Vegetables";
            NSUInteger row = [indexPath row];
            cell.textLabel.text = [vegiArray objectAtIndex:row];
        }
        else if (plantCategoryInt == 1){
            self.navigationItem.title = @"Herbs";
            NSUInteger row = [indexPath row];
            cell.textLabel.text = [herbArray objectAtIndex:row];
        }
        else if (plantCategoryInt == 2){
            self.navigationItem.title = @"Fruits";
            NSUInteger row = [indexPath row];
            cell.textLabel.text = [fruitArray objectAtIndex:row];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
