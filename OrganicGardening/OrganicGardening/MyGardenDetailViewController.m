//
//  MyGardenDetailViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/2/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "MyGardenDetailViewController.h"
#import "PlantDetailViewController.h"

@interface MyGardenDetailViewController ()

@end

@implementation MyGardenDetailViewController
@synthesize gardenObject, plantDateLabel, germDateLabel, tranDateLabel, harvDateLabel, plantImage;

- (void)viewDidLoad {
    
    //set title with image name
    self.title = [gardenObject objectForKey:@"mgName"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self plantQuery];
    
    plantDateLabel.text = [gardenObject objectForKey:@"plantDate"];
    germDateLabel.text = [gardenObject objectForKey:@"germDate"];
    tranDateLabel.text = [gardenObject objectForKey:@"tranDate"];
    harvDateLabel.text = [gardenObject objectForKey:@"harvDate"];
    PFFile *imageFile = [gardenObject objectForKey:@"mgImage"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.plantImage.image = [UIImage imageWithData:imageData];
}

- (void)plantQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"name" equalTo:[gardenObject objectForKey:@"mgName"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            plantArry = [[NSArray alloc] initWithArray:objects];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
