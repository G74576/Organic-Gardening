//
//  LoginViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/31/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.logInView setBackgroundColor:[UIColor whiteColor]];
    [self.logInView setLogo:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]]];
    [self.logInView.logInButton setBackgroundColor:[UIColor colorWithRed:(51/255.0) green:(204/255.0) blue:(51/255.0) alpha:1]];
    [self.logInView.logInButton setBackgroundImage:nil forState:UIControlStateNormal];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Set frame for elements
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
