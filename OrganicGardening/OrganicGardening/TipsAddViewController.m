//
//  TipsAddViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/3/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "TipsAddViewController.h"

@interface TipsAddViewController ()

@end

@implementation TipsAddViewController
@synthesize tipDes, tipName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tipName.delegate = self;
    self.tipDes.delegate = self;
    
    [[self.tipDes layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[self.tipDes layer] setBorderWidth:1.0];
    [[self.tipDes layer] setCornerRadius:8.0];
    
}

//Save Tip/Trick
-(void)saveButton:(id)sender{
    
    if ([PFUser currentUser]) {
        UIAlertView *addTip = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Add Tip or Trick?"] message:@"Are you sure you want to add this tip or trick?" delegate:self cancelButtonTitle:@"Add" otherButtonTitles:@"Cancel", nil];
        
        [addTip show];
    } else
    {
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.tipName resignFirstResponder];
    [self.tipDes resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

//Method to post tip/trick to Parse database
-(void)postParse{
    PFUser *user = [PFUser currentUser];
    
    PFObject *postTip = [PFObject objectWithClassName:@"TipsTricks"];
    
    postTip[@"tipName"] = tipName.text;
    postTip[@"tipInfo"] = tipDes.text;
    postTip[@"user"] = user;
    [postTip save];
    UIView *parent = self.view.superview;
    [self.view removeFromSuperview];
    self.view = nil;
    [parent addSubview:self.view];
    
    [[[UIAlertView alloc] initWithTitle:@"Tip or Trick has been added!"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Alertview delegate methods
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Add"]) {
        [self postParse];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
    else if ([title isEqualToString:@"OK"]){
        tipName.text = tipName.placeholder;
        tipDes.text = @"";
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
