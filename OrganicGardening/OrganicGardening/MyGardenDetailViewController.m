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
@synthesize gardenObject, plantDateLabel, germDateLabel, tranDateLabel, harvDateLabel, plantImage, plantHeader, germHeader, harvHeader, tranHeader, editButton, saveButton, dateObject, userDateObjet, headerLabel;

- (void)viewDidLoad {
    
    //set title with image name
    self.title = [gardenObject objectForKey:@"mgName"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self plantQuery];
    
    objectID = [gardenObject objectId];
    
    plantDateLabel.text = [gardenObject objectForKey:@"plantDate"];
    germDateLabel.text = [gardenObject objectForKey:@"germDate"];
    tranDateLabel.text = [gardenObject objectForKey:@"tranDate"];
    harvDateLabel.text = [gardenObject objectForKey:@"harvDate"];
    PFFile *imageFile = [gardenObject objectForKey:@"mgImage"];
    NSURL *imageFileURL = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
    self.plantImage.image = [UIImage imageWithData:imageData];
    
    PFQuery *query1 = [PFQuery queryWithClassName:@"Plants"];
    [query1 whereKey:@"name" equalTo:[gardenObject objectForKey:@"mgName"]];
    [query1 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        dateObject = object;
    }];

}

- (void)plantQuery{
    PFQuery *query = [PFQuery queryWithClassName:@"Plants"];
    [query whereKey:@"name" equalTo:[gardenObject objectForKey:@"mgName"]];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        gardenObject = object;
    }];
}


//Method to set datePicker and hide all labels
- (void)datePickerView
{
    // Initialization code
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 325, 250)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    plantDateLabel.hidden = YES;
    germDateLabel.hidden = YES;
    tranDateLabel.hidden = YES;
    harvDateLabel.hidden = YES;
    plantHeader.hidden = YES;
    germHeader.hidden = YES;
    tranHeader.hidden = YES;
    harvHeader.hidden = YES;
    editButton.hidden = YES;
    headerLabel.hidden = YES;
    [self.view addSubview:datePicker];
    [datePicker addTarget:self
                   action:@selector(changeDateInLabel:)
         forControlEvents:UIControlEventValueChanged];
    saveButton.hidden = NO;
}


//Change date for plantDateLabel
- (void)changeDateInLabel:(id)sender{
    //Use NSDateFormatter to write out the date in a friendly format
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"EEE, MMM dd yyyy"];
    plantDateLabel.text = [NSString stringWithFormat:@"%@",
                           [df stringFromDate:datePicker.date]];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [datePicker removeFromSuperview];
    plantDateLabel.hidden = NO;
    germDateLabel.hidden = NO;
    tranDateLabel.hidden = NO;
    harvDateLabel.hidden = NO;
    plantHeader.hidden = NO;
    germHeader.hidden = NO;
    tranHeader.hidden = NO;
    harvHeader.hidden = NO;
    headerLabel.hidden = NO;
}

//Edit Date Button
- (IBAction)editDate:(id)sender {
    [self performSelector:@selector(datePickerView)];
}

//Save Date Button
- (void)saveDate:(id)sender{
    if ([PFUser currentUser]) {
        UIAlertView *saveNewDate = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Save new plant date?"] message:nil delegate:self cancelButtonTitle:@"Save" otherButtonTitles:@"Cancel", nil];
        
        [saveNewDate show];
    } else
    {
        
    }
}

//Post Changes to Parse database & Update labels in view with new dates:
- (void)postDate{
    PFQuery *query = [PFQuery queryWithClassName:@"MyGarden"];
    
    PFObject *newDateObj = dateObject;
//    PFObject *newUserDate = userDateObjet;
    [query getObjectInBackgroundWithId:objectID block:^(PFObject *object, NSError *error){
        //Set Plant Date:
        NSDateFormatter *form = [[NSDateFormatter alloc]init];
        [form setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *plantDateString = [NSString stringWithFormat:@"%@", [form stringFromDate:datePicker.date]];
        
        object[@"plantDate"] = plantDateString;
        
        //Set Germination Date:
        NSString *germString = [NSString stringWithFormat:@"%@", [newDateObj objectForKey:@"germDate"]];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *germNumber = [f numberFromString:germString];
        int numb = [germNumber intValue];
        NSDate *now = [datePicker date];
        NSDate *newDate1 = [now dateByAddingTimeInterval:60*60*24*numb];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDate = [formatter stringFromDate:newDate1];
        //NSLog(@"%@", stringFromDate);
        
        object[@"germDate"] = stringFromDate;
        germDateLabel.text = stringFromDate;

        
        //Set Transplant Date:
        NSString *tranString = [NSString stringWithFormat:@"%@", [newDateObj objectForKey:@"tranDate"]];
        NSNumberFormatter *fo = [[NSNumberFormatter alloc] init];
        [fo setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *tranNumber = [fo numberFromString:tranString];
        int tNumb = [tranNumber intValue];
        NSDate *nowA = [datePicker date];
        NSDate *newDate2 = [nowA dateByAddingTimeInterval:60*60*24*tNumb];
        NSDateFormatter *formatterA = [[NSDateFormatter alloc] init];
        [formatterA setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDateA = [formatterA stringFromDate:newDate2];
        //NSLog(@"%@", stringFromDateA);
        
        object[@"tranDate"] = stringFromDateA;
        tranDateLabel.text = stringFromDateA;
        
        //Set Harvest Date:
        NSString *harvString = [NSString stringWithFormat:@"%@", [newDateObj objectForKey:@"harvDate"]];
        NSNumberFormatter *f1 = [[NSNumberFormatter alloc] init];
        [f1 setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *harvNumb = [f1 numberFromString:harvString];
        int hNumb = [harvNumb intValue];
        NSDate *nowB = [datePicker date];
        NSDate *newDate3 = [nowB dateByAddingTimeInterval:60*60*24*hNumb];
        NSDateFormatter *formatterB = [[NSDateFormatter alloc] init];
        [formatterB setDateFormat:@"EEE, MMM dd yyyy"];
        NSString *stringFromDateB = [formatterB stringFromDate:newDate3];
        //NSLog(@"%@", stringFromDateB);
        object[@"harvDate"] = stringFromDateB;
        
        [object saveInBackground];
        harvDateLabel.text = stringFromDateB;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"PlantDetailMy"]) {
        PlantDetailViewController *dvc = segue.destinationViewController;
        if (dvc != nil) {
            dvc.plantObject = gardenObject;
        }
        
    }
}

//AlertView delegate method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Save"]) {
        [self postDate];
        editButton.hidden = NO;
        saveButton.hidden = YES;
        
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
}

@end
