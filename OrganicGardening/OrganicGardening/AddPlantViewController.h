//
//  AddPlantViewController.h
//  OrganicGardening
//
//  Created by Kevin O'Toole on 4/14/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPlantViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>{
    
    //Bool for checkboxes
    BOOL checked;
    BOOL z1Checked;
    BOOL z2Checked;
    BOOL z3Checked;
    BOOL z4Checked;
    BOOL z5Checked;
    BOOL z6Checked;
    BOOL z7Checked;
    BOOL z8Checked;
    BOOL z9Checked;
    BOOL z10Checked;
    BOOL z11Checked;
    BOOL fullCheck;
    BOOL fullParCheck;
    BOOL parCheck;
    BOOL normCheck;
    BOOL lowCheck;
    BOOL vegCheck;
    BOOL herbCheck;
    BOOL fruitCheck;

    IBOutlet UIScrollView *scrollView;
    
}

@property (strong, nonatomic) NSArray *pickerArray;

@property (strong, nonatomic) IBOutlet UITextField *plantName;
@property (strong, nonatomic) IBOutlet UIButton *vegetable;
@property (strong, nonatomic) IBOutlet UIButton *herb;
@property (strong, nonatomic) IBOutlet UIButton *fruit;
@property (strong, nonatomic) IBOutlet UITextView *plantDetails;
@property (weak, nonatomic) IBOutlet UIPickerView *difficulty;
@property (weak, nonatomic) IBOutlet UIButton *zone1;
@property (weak, nonatomic) IBOutlet UIButton *zone2;
@property (weak, nonatomic) IBOutlet UIButton *zone3;
@property (weak, nonatomic) IBOutlet UIButton *zone4;
@property (weak, nonatomic) IBOutlet UIButton *zone5;
@property (weak, nonatomic) IBOutlet UIButton *zone6;
@property (weak, nonatomic) IBOutlet UIButton *zone7;
@property (weak, nonatomic) IBOutlet UIButton *zone8;
@property (weak, nonatomic) IBOutlet UIButton *zone9;
@property (weak, nonatomic) IBOutlet UIButton *zone10;
@property (weak, nonatomic) IBOutlet UIButton *zone11;
@property (weak, nonatomic) IBOutlet UIButton *full;
@property (weak, nonatomic) IBOutlet UIButton *fullPar;
@property (weak, nonatomic) IBOutlet UIButton *partial;
@property (weak, nonatomic) IBOutlet UIButton *normal;
@property (weak, nonatomic) IBOutlet UIButton *low;
@property (strong, nonatomic) IBOutlet UITextView *soil;
@property (strong, nonatomic) IBOutlet UITextView *timeToPlant;
@property (strong, nonatomic) IBOutlet UITextView *spacing;
@property (strong, nonatomic) IBOutlet UITextView *container;
@property (strong, nonatomic) IBOutlet UITextView *height;
@property (strong, nonatomic) IBOutlet UITextView *tips;
@property (strong, nonatomic) IBOutlet UITextField *germination;
@property (strong, nonatomic) IBOutlet UITextField *transplant;
@property (strong, nonatomic) IBOutlet UITextField *harvest;
@property (weak, nonatomic) IBOutlet UIButton *share;
@property (strong, nonatomic) IBOutlet UIView *imageFrame;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)takePhoto:(id)sender;

- (IBAction)category:(id)sender;

- (IBAction)zone1Check:(id)sender;
- (IBAction)zone2Check:(id)sender;
- (IBAction)zone3Check:(id)sender;
- (IBAction)zone4Check:(id)sender;
- (IBAction)zone5Check:(id)sender;
- (IBAction)zone6Check:(id)sender;
- (IBAction)zone7Check:(id)sender;
- (IBAction)zone8Check:(id)sender;
- (IBAction)zone9Check:(id)sender;
- (IBAction)zone10Check:(id)sender;
- (IBAction)zone11Check:(id)sender;
- (IBAction)sunCheck:(id)sender;
- (IBAction)waterCheck:(id)sender;
- (IBAction)shareCheck:(id)sender;
- (IBAction)save:(id)sender;

@end
