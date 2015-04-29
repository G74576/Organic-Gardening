//
//  EditTipViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/16/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "EditTipViewController.h"
#import "TipsTableViewController.h"

@interface EditTipViewController ()

@end

@implementation EditTipViewController
@synthesize editTipDes, editTipName, editObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editTipName.delegate = self;
    self.editTipDes.delegate = self;
    
    [[self.editTipDes layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.editTipDes layer] setBorderWidth:1.0];
    [[self.editTipDes layer] setCornerRadius:8.0];
    
    editNameText = [editObject objectForKey:@"tipName"];
    editDesText = [editObject objectForKey:@"tipInfo"];
    objectID = [editObject objectId];
    
    editTipName.text = editNameText;
    editTipDes.text = editDesText;
}

//Save Button
-(IBAction)saveButton:(id)sender{
    
    if ([PFUser currentUser]) {
        UIAlertView *addTip = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Save Tip or Trick?"] message:@"Are you sure you want to save this edited tip or trick?" delegate:self cancelButtonTitle:@"Save" otherButtonTitles:@"Cancel", nil];
        
        [addTip show];
    } else
    {
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.editTipName resignFirstResponder];
    [self.editTipDes resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

//Method to post edited changes to tip/trick to parse
-(void)postParse{
    
    PFQuery *query = [PFQuery queryWithClassName:@"TipsTricks"];
    [query getObjectInBackgroundWithId:objectID block:^(PFObject *object, NSError *error) {
        object[@"tipName"] = editTipName.text;
        object[@"tipInfo"] = editTipDes.text;
        [object saveInBackground];
    }];
    [[[UIAlertView alloc] initWithTitle:@"Tip or Trick has been Edited!"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Alertview delegate method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Save"]) {
        [self postParse];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
    else if ([title isEqualToString:@"OK"]){
        
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
