//
//  PlantDetailViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/21/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "PlantDetailViewController.h"
#import "PlantListTableViewController.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>


@interface PlantDetailViewController ()

@end

@implementation PlantDetailViewController
@synthesize plantObject, details, difficulty, zone, sun, soil, water, best, container, germ, trans, harv, tips, spacing, height, plantImage;

- (void)viewDidLoad {

    //self.title = pInfo.plantName;
    self.title = [plantObject objectForKey:@"name"];
    [super viewDidLoad];
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(375, 719)];
    // Do any additional setup after loading the view.
    
    details.text = [plantObject objectForKey:@"details"];
    difficulty.text = [plantObject objectForKey:@"difficulty"];
    zone.text = [plantObject objectForKey:@"zone"];
    sun.text = [plantObject objectForKey:@"sun"];
    soil.text = [plantObject objectForKey:@"soil"];
    water.text = [plantObject objectForKey:@"water"];
    best.text = [plantObject objectForKey:@"timeToPlant"];
    container.text = [plantObject objectForKey:@"container"];
    germ.text = [plantObject objectForKey:@"germination"];
    trans.text = [plantObject objectForKey:@"transplant"];
    harv.text = [plantObject objectForKey:@"harvest"];
    tips.text = [plantObject objectForKey:@"tips"];
    spacing.text = [plantObject objectForKey:@"spacing"];
    height.text = [plantObject objectForKey:@"height"];
    PFFile *imageFile = [plantObject objectForKey:@"image"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.plantImage.image = [UIImage imageWithData:imageData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addToGarden:(id)sender{
    if ([PFUser currentUser]) {
        UIAlertView *addToGarden = [[UIAlertView alloc]initWithTitle:@"Add to garden?" message:@"Are you sure you want to add this item to your garden?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [addToGarden show];
    } else
    {

    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"OK"]) {
        
        PFUser *user = [PFUser currentUser];
        
        PFObject *postEvent = [PFObject objectWithClassName:@"MyGarden"];
        
        postEvent[@"mgName"] = [plantObject objectForKeyedSubscript:@"name"];
        postEvent[@"mgImage"] = [plantObject objectForKeyedSubscript:@"image"];
        
        //Set Plant Date:
        NSDate *plantDate = [NSDate date];
        NSDateFormatter *form = [[NSDateFormatter alloc]init];
        [form setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *plantDateString = [form stringFromDate:plantDate];
        
        postEvent[@"plantDate"] = plantDateString;
        
        //Set Germination Date:
        NSString *germString = [NSString stringWithFormat:@"%@", [plantObject objectForKey:@"germDate"]];
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
        NSString *tranString = [NSString stringWithFormat:@"%@", [plantObject objectForKey:@"tranDate"]];
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
        NSString *harvString = [NSString stringWithFormat:@"%@", [plantObject objectForKey:@"harvDate"]];
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
        
        [[[UIAlertView alloc] initWithTitle:@"Add To My Garden"
                                    message:@"Added to your personal garden!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
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
