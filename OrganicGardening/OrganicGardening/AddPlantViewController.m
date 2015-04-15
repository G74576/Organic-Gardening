//
//  AddPlantViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/14/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "AddPlantViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface AddPlantViewController ()

@end

@implementation AddPlantViewController
@synthesize plantName, plantDetails, difficulty, zone1, zone10, zone11, zone2, zone3, zone4, zone5, zone6, zone7, zone8, zone9, full, fullPar, partial, normal, low, soil, timeToPlant, spacing, container, height, germination, transplant, harvest, share, pickerArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(375, 944)];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    [scrollView addGestureRecognizer:gestureRecognizer];
    
    self.plantName.delegate = self;
    self.plantDetails.delegate = self;
    self.soil.delegate = self;
    self.timeToPlant.delegate = self;
    self.spacing.delegate = self;
    self.container.delegate = self;
    self.height.delegate = self;
    self.germination.delegate = self;
    self.transplant.delegate = self;
    self.harvest.delegate = self;
    
    //Details TextView
    [plantDetails.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [plantDetails.layer setBorderWidth:1.0];
    plantDetails.layer.cornerRadius = 5;
    plantDetails.clipsToBounds = YES;
    //Soil TextView
    [soil.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [soil.layer setBorderWidth:1.0];
    soil.layer.cornerRadius = 5;
    soil.clipsToBounds = YES;
    //timeToPlant TextView
    [timeToPlant.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [timeToPlant.layer setBorderWidth:1.0];
    timeToPlant.layer.cornerRadius = 5;
    timeToPlant.clipsToBounds = YES;
    //spacing TextView
    [spacing.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [spacing.layer setBorderWidth:1.0];
    spacing.layer.cornerRadius = 5;
    spacing.clipsToBounds = YES;
    //container TextView
    [container.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [container.layer setBorderWidth:1.0];
    container.layer.cornerRadius = 5;
    container.clipsToBounds = YES;
    //height TextView
    [height.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [height.layer setBorderWidth:1.0];
    height.layer.cornerRadius = 5;
    height.clipsToBounds = YES;
    
    checked = NO;
    z1Checked = NO;
    z2Checked = NO;
    z3Checked = NO;
    z4Checked = NO;
    z5Checked = NO;
    z6Checked = NO;
    z7Checked = NO;
    z8Checked = NO;
    z9Checked = NO;
    z10Checked = NO;
    z11Checked = NO;
    fullCheck = NO;
    fullParCheck = NO;
    parCheck = NO;
    normCheck = NO;
    lowCheck = NO;
    
    NSArray *pickerData = [[NSArray alloc]initWithObjects:@"Easy", @"Medium", @"Moderate", @"Hard", nil];
    
    self.pickerArray = pickerData;
}

- (IBAction)hideKeyboard:(id)sender {
    [plantName endEditing:YES];
    [plantDetails endEditing:YES];
    [soil endEditing:YES];
    [timeToPlant endEditing:YES];
    [spacing endEditing:YES];
    [container endEditing:YES];
    [height endEditing:YES];
    [germination endEditing:YES];
    [transplant endEditing:YES];
    [harvest endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Post To Parse
-(void)postParse{
    PFUser *user = [PFUser currentUser];
    
    PFObject *postEvent = [PFObject objectWithClassName:@"UsersPlants"];
    
    postEvent[@"name"] = plantName.text;        //Plant Name
    postEvent[@"details"] = plantDetails.text;  //Plant details
    //Get difficulty from picker
    NSString *diffString = [pickerArray objectAtIndex:[difficulty selectedRowInComponent:0]];
    postEvent[@"difficulty"] = diffString;      //Difficulty
    //Get Sun
    NSString *sun;
    if (fullCheck == YES) {
        sun = @"Full Sun";
    }
    if (fullParCheck == YES){
        sun = @"Full Sun to Partial Shade";
    }
    if (parCheck == YES) {
        sun = @"Partial Sun";
    }
    postEvent[@"sun"] = sun;                    //Sun requirements
    //Get watering
    NSString *watering;
    if (normCheck == YES) {
        watering = @"Normal Watering";
    }
    if (lowCheck == YES) {
        watering = @"Low Watering";
    }
    postEvent[@"water"] = watering;             //Water requirements
    postEvent[@"soil"] = soil.text;             //Soil requirements
    postEvent[@"timeToPlant"] = timeToPlant.text;    //Time to plant details
    postEvent[@"spacing"] = spacing.text;       //Spacing details
    postEvent[@"container"] = container.text;   //container details
    postEvent[@"height"] = height.text;         //Height details
    NSNumber *z1Num = [NSNumber numberWithBool:z1Checked];
    postEvent[@"z1"] = z1Num;
    NSNumber *z2Num = [NSNumber numberWithBool:z2Checked];
    postEvent[@"z2"] = z2Num;
    NSNumber *z3Num = [NSNumber numberWithBool:z3Checked];
    postEvent[@"z3"] = z3Num;
    NSNumber *z4Num = [NSNumber numberWithBool:z4Checked];
    postEvent[@"z4"] = z4Num;
    NSNumber *z5Num = [NSNumber numberWithBool:z5Checked];
    postEvent[@"z5"] = z5Num;
    NSNumber *z6Num = [NSNumber numberWithBool:z6Checked];
    postEvent[@"z6"] = z6Num;
    NSNumber *z7Num = [NSNumber numberWithBool:z7Checked];
    postEvent[@"z7"] = z7Num;
    NSNumber *z8Num = [NSNumber numberWithBool:z8Checked];
    postEvent[@"z8"] = z8Num;
    NSNumber *z9Num = [NSNumber numberWithBool:z9Checked];
    postEvent[@"z9"] = z9Num;
    NSNumber *z10Num = [NSNumber numberWithBool:z10Checked];
    postEvent[@"z10"] = z10Num;
    NSNumber *z11Num = [NSNumber numberWithBool:z11Checked];
    postEvent[@"z11"] = z11Num;
    
    postEvent[@"user"] = user;
    [postEvent save];
    UIView *parent = self.view.superview;
    [self.view removeFromSuperview];
    self.view = nil;
    [parent addSubview:self.view];
    
    [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Added Plant to List"]
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

#pragma mark - Difficulty Picker Data Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return pickerArray.count;
    
}

#pragma mark - Difficulty Picker Delegate Methods

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [pickerArray objectAtIndex:row];
}

#pragma mark - Check Boxes
//checking to see if checboxes are checked or uncheced.
- (IBAction)zone1Check:(id)sender {
    if (!z1Checked) {
        [zone1 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z1Checked = YES;
    }
    else if (z1Checked){
        [zone1 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z1Checked = NO;
    }
}

- (IBAction)zone2Check:(id)sender {
    if (!z2Checked) {
        [zone2 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z2Checked = YES;
    }
    else if (z2Checked){
        [zone2 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z2Checked = NO;
    }
}

- (IBAction)zone3Check:(id)sender {
    if (!z3Checked) {
        [zone3 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z3Checked = YES;
    }
    else if (z3Checked){
        [zone3 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z3Checked = NO;
    }
}

- (IBAction)zone4Check:(id)sender {
    if (!z4Checked) {
        [zone4 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z4Checked = YES;
    }
    else if (z4Checked){
        [zone4 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z4Checked = NO;
    }
}

- (IBAction)zone5Check:(id)sender {
    if (!z5Checked) {
        [zone5 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z5Checked = YES;
    }
    else if (z5Checked){
        [zone5 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z5Checked = NO;
    }
}

- (IBAction)zone6Check:(id)sender {
    if (!z6Checked) {
        [zone6 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z6Checked = YES;
    }
    else if (z6Checked){
        [zone6 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z6Checked = NO;
    }
}

- (IBAction)zone7Check:(id)sender {
    if (!z7Checked) {
        [zone7 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z7Checked = YES;
    }
    else if (z7Checked){
        [zone7 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z7Checked = NO;
    }
}

- (IBAction)zone8Check:(id)sender {
    if (!z8Checked) {
        [zone8 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z8Checked = YES;
    }
    else if (z8Checked){
        [zone8 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z8Checked = NO;
    }
}

- (IBAction)zone9Check:(id)sender {
    if (!z9Checked) {
        [zone9 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z9Checked = YES;
    }
    else if (z9Checked){
        [zone9 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z9Checked = NO;
    }
}

- (IBAction)zone10Check:(id)sender {
    if (!z10Checked) {
        [zone10 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z10Checked = YES;
    }
    else if (z10Checked){
        [zone10 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z10Checked = NO;
    }
}

- (IBAction)zone11Check:(id)sender {
    if (!z11Checked) {
        [zone11 setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        z11Checked = YES;
    }
    else if (z11Checked){
        [zone11 setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        z11Checked = NO;
    }
}

- (IBAction)sunCheck:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 12:
            if (!fullCheck) {
                [full setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [fullPar setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [partial setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fullCheck = YES;
                fullParCheck = NO;
                parCheck = NO;
            }
            else if (fullCheck){
                [full setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fullCheck = NO;
                fullParCheck = NO;
                parCheck = NO;
            }
            break;
        case 13:
            if (!fullParCheck) {
                [fullPar setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [full setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [partial setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fullParCheck = YES;
                fullCheck = NO;
                parCheck = NO;
            }
            else if (fullParCheck){
                [fullPar setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fullParCheck = NO;
                fullCheck = NO;
                parCheck = NO;
            }
            break;
        case 14:
            if (!parCheck) {
                [partial setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [fullPar setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [full setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                parCheck = YES;
                fullCheck = NO;
                fullParCheck = NO;
            }
            else if (parCheck){
                [partial setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                parCheck = NO;
                fullCheck = NO;
                fullParCheck = NO;
            }
            break;
            
        default:
            break;
    }
}

- (IBAction)waterCheck:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 15:
            if (!normCheck) {
                [normal setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [low setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                normCheck = YES;
                lowCheck = NO;
            }
            else if (normCheck){
                [normal setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                normCheck = NO;
                lowCheck = NO;
            }
            break;
        case 16:
            if (!lowCheck) {
                [low setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [normal setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                lowCheck = YES;
                normCheck = NO;
            }
            else if (lowCheck){
                [low setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                lowCheck = NO;
                normCheck = NO;
            }
            break;
        default:
            break;
    }
}

- (IBAction)shareCheck:(id)sender {
    if (!checked) {
        [share setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
        checked = YES;
    }
    else if (checked){
        [share setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
        checked = NO;
    }
}

- (IBAction)save:(id)sender {
    if ([PFUser currentUser]) {
        UIAlertView *addToGarden = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Are you sure you want to add this item to the list?"] message:nil delegate:self cancelButtonTitle:@"Add" otherButtonTitles:@"Cancel", nil];
        
        [addToGarden show];
    } else
    {
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Add"]) {
        [self postParse];
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
