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
#import <AVFoundation/AVFoundation.h>

@interface AddPlantViewController ()

@end

@implementation AddPlantViewController
@synthesize plantName, plantDetails, difficulty, zone1, zone10, zone11, zone2, zone3, zone4, zone5, zone6, zone7, zone8, zone9, full, fullPar, partial, normal, low, soil, timeToPlant, spacing, container, height, tips, germination, transplant, harvest, share, pickerArray, imageFrame, imageView, scrollView, vegetable, herb, fruit;

AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;

- (void)viewDidLoad {
    
    self.title = @"Add A Plant";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(375, 1544)];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    [scrollView addGestureRecognizer:gestureRecognizer];
    
    self.plantName.delegate = self;
    //TextView Placeholders
    self.plantDetails.delegate = self;
    [plantDetails setReturnKeyType:UIReturnKeyDone];
    [plantDetails setText:@"Details about the plant will go here..."];
    [plantDetails setTextColor:[UIColor lightGrayColor]];

    self.soil.delegate = self;
    [soil setReturnKeyType:UIReturnKeyDone];
    [soil setText:@"Details about the soil will go here..."];
    [soil setTextColor:[UIColor lightGrayColor]];
   
    self.timeToPlant.delegate = self;
    [timeToPlant setReturnKeyType:UIReturnKeyDone];
    [timeToPlant setText:@"Details about when to plant will go here..."];
    [timeToPlant setTextColor:[UIColor lightGrayColor]];

    self.spacing.delegate = self;
    [spacing setReturnKeyType:UIReturnKeyDone];
    [spacing setText:@"Details about spacing will go here..."];
    [spacing setTextColor:[UIColor lightGrayColor]];

    self.container.delegate = self;
    [container setReturnKeyType:UIReturnKeyDone];
    [container setText:@"Details about container size will go here..."];
    [container setTextColor:[UIColor lightGrayColor]];

    self.height.delegate = self;
    [height setReturnKeyType:UIReturnKeyDone];
    [height setText:@"Details about plant height will go here..."];
    [height setTextColor:[UIColor lightGrayColor]];

    self.tips.delegate = self;
    [tips setReturnKeyType:UIReturnKeyDone];
    [tips setText:@"Put any tips about this plant here..."];
    [tips setTextColor:[UIColor lightGrayColor]];
    
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
    //Tips TextView
    [tips.layer setBorderColor:[[[UIColor lightGrayColor]colorWithAlphaComponent:0.5]CGColor]];
    [tips.layer setBorderWidth:1.0];
    tips.layer.cornerRadius = 5;
    tips.clipsToBounds = YES;
    
    checked = NO;
    vegCheck = NO;
    herbCheck = NO;
    fruitCheck = NO;
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


#pragma mark - View for camera
-(void)viewWillAppear:(BOOL)animated{
    session = [[AVCaptureSession alloc]init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResize];
    CALayer *rootLayer = [[self scrollView]layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.imageFrame.frame;
    
    [previewLayer setFrame:frame];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    stillImageOutput = [[AVCaptureStillImageOutput alloc]init];
    NSDictionary *outPutSettings = [[NSDictionary alloc]initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings:outPutSettings];
    
    [session addOutput:stillImageOutput];
    [session startRunning];
}

-(void)takePhoto:(id)sender{
    AVCaptureConnection *videoConnection = nil;
    
    for (AVCaptureConnection *connection in stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) {
            break;
        }
    }
    
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer != NULL) {
            NSData *imageDatea = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageDatea];
            self.imageView.image = image;
        }
    }];
}

#pragma mark TextView placeholder methods

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if (plantDetails.textColor == [UIColor lightGrayColor]) {
        plantDetails.text = @"";
        plantDetails.textColor = [UIColor blackColor];
    }
    else if (soil.textColor == [UIColor lightGrayColor]) {
        soil.text = @"";
        soil.textColor = [UIColor blackColor];
    }
    else if (timeToPlant.textColor == [UIColor lightGrayColor]) {
        timeToPlant.text = @"";
        timeToPlant.textColor = [UIColor blackColor];
    }
    else if (spacing.textColor == [UIColor lightGrayColor]) {
        spacing.text = @"";
        spacing.textColor = [UIColor blackColor];
    }
    else if (container.textColor == [UIColor lightGrayColor]) {
        container.text = @"";
        container.textColor = [UIColor blackColor];
    }
    else if (height.textColor == [UIColor lightGrayColor]) {
        height.text = @"";
        height.textColor = [UIColor blackColor];
    }
    else if (tips.textColor == [UIColor lightGrayColor]) {
        tips.text = @"";
        tips.textColor = [UIColor blackColor];
    }
    
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(plantDetails.text.length == 0){
        plantDetails.textColor = [UIColor lightGrayColor];
        plantDetails.text = @"Details about the plant will go here...";
        [plantDetails resignFirstResponder];
    }
    if(soil.text.length == 0){
        soil.textColor = [UIColor lightGrayColor];
        soil.text = @"Details about the soil will go here...";
        [soil resignFirstResponder];
    }
    if(timeToPlant.text.length == 0){
        timeToPlant.textColor = [UIColor lightGrayColor];
        timeToPlant.text = @"Details about when to plant will go here...";
        [timeToPlant resignFirstResponder];
    }
    if(spacing.text.length == 0){
        spacing.textColor = [UIColor lightGrayColor];
        spacing.text = @"Details about spacing will go here...";
        [spacing resignFirstResponder];
    }
    if(container.text.length == 0){
        container.textColor = [UIColor lightGrayColor];
        container.text = @"Details about container size will go here...";
        [container resignFirstResponder];
    }
    if(height.text.length == 0){
        height.textColor = [UIColor lightGrayColor];
        height.text = @"Details about plant height will go here...";
        [height resignFirstResponder];
    }
    if(tips.text.length == 0){
        tips.textColor = [UIColor lightGrayColor];
        tips.text = @"Put any tips about this plant here...";
        [tips resignFirstResponder];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        if(plantDetails.text.length == 0){
            plantDetails.textColor = [UIColor lightGrayColor];
            plantDetails.text = @"Details about the plant will go here...";
            [plantDetails resignFirstResponder];
        }
        if(soil.text.length == 0){
            soil.textColor = [UIColor lightGrayColor];
            soil.text = @"Details about the soil will go here...";
            [soil resignFirstResponder];
        }
        if(timeToPlant.text.length == 0){
            timeToPlant.textColor = [UIColor lightGrayColor];
            timeToPlant.text = @"Details about when to plant will go here...";
            [timeToPlant resignFirstResponder];
        }
        if(spacing.text.length == 0){
            spacing.textColor = [UIColor lightGrayColor];
            spacing.text = @"Details about spacing will go here...";
            [spacing resignFirstResponder];
        }
        if(container.text.length == 0){
            container.textColor = [UIColor lightGrayColor];
            container.text = @"Details about container size will go here...";
            [container resignFirstResponder];
        }
        if(height.text.length == 0){
            height.textColor = [UIColor lightGrayColor];
            height.text = @"Details about plant height will go here...";
            [height resignFirstResponder];
        }
        if(tips.text.length == 0){
            tips.textColor = [UIColor lightGrayColor];
            tips.text = @"Put any tips about this plant here...";
            [tips resignFirstResponder];
        }
        return NO;
    }
    
    return YES;
}

//Hide keyboard for when in scrollview
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
    [tips endEditing:YES];
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
    
    //Plant Name
    postEvent[@"name"] = plantName.text;
    
    //Vegetable Category
    NSString *cat;
    if (vegCheck == YES) {
        cat = @"Vegetable";
    }
    if (herbCheck == YES) {
        cat = @"Herb";
    }
    if (fruitCheck == YES) {
        cat = @"Fruit";
    }
    postEvent[@"category"] = cat;
    
    //Plant details
    postEvent[@"details"] = plantDetails.text;
    
    //Difficulty
    NSString *diffString = [pickerArray objectAtIndex:[difficulty selectedRowInComponent:0]];
    postEvent[@"difficulty"] = diffString;
    
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
    postEvent[@"sun"] = sun;
    
    //Get watering
    NSString *watering;
    if (normCheck == YES) {
        watering = @"Normal Watering";
    }
    if (lowCheck == YES) {
        watering = @"Low Watering";
    }
    postEvent[@"water"] = watering;
    
    //Soil requirements
    postEvent[@"soil"] = soil.text;
    
    //Time to plant details
    postEvent[@"timeToPlant"] = timeToPlant.text;
    
    //Spacing details
    postEvent[@"spacing"] = spacing.text;
    
    //container details
    postEvent[@"container"] = container.text;
    
    //Height details
    postEvent[@"height"] = height.text;
    
    //Tips
    postEvent[@"tips"] = tips.text;
    
    //Zone Information
    NSNumber *z1Num = [NSNumber numberWithBool:z1Checked];
    postEvent[@"z1"] = z1Num;                   //Zone 1 Boolean
    NSNumber *z2Num = [NSNumber numberWithBool:z2Checked];
    postEvent[@"z2"] = z2Num;                   //Zone 2 Boolean
    NSNumber *z3Num = [NSNumber numberWithBool:z3Checked];
    postEvent[@"z3"] = z3Num;                   //Zone 3 Boolean
    NSNumber *z4Num = [NSNumber numberWithBool:z4Checked];
    postEvent[@"z4"] = z4Num;                   //Zone 4 Boolean
    NSNumber *z5Num = [NSNumber numberWithBool:z5Checked];
    postEvent[@"z5"] = z5Num;                   //Zone 5 Boolean
    NSNumber *z6Num = [NSNumber numberWithBool:z6Checked];
    postEvent[@"z6"] = z6Num;                   //Zone 6 Boolean
    NSNumber *z7Num = [NSNumber numberWithBool:z7Checked];
    postEvent[@"z7"] = z7Num;                   //Zone 7 Boolean
    NSNumber *z8Num = [NSNumber numberWithBool:z8Checked];
    postEvent[@"z8"] = z8Num;                   //Zone 8 Boolean
    NSNumber *z9Num = [NSNumber numberWithBool:z9Checked];
    postEvent[@"z9"] = z9Num;                   //Zone 9 Boolean
    NSNumber *z10Num = [NSNumber numberWithBool:z10Checked];
    postEvent[@"z10"] = z10Num;                 //Zone 10 Boolean
    NSNumber *z11Num = [NSNumber numberWithBool:z11Checked];
    postEvent[@"z11"] = z11Num;                 //Zone 11 Boolean
    
    //Share Plant to other users
    NSNumber *shareNum = [NSNumber numberWithBool:checked];
    postEvent[@"share"] = shareNum;
    
    //Set Germination String
    postEvent[@"germination"] = [NSString stringWithFormat:@"%@ days.", germination.text];
    
    //Set Transplant String
    postEvent[@"transplant"] = [NSString stringWithFormat:@"%@ days.", transplant.text];
    
    //Set Harvest String
    postEvent[@"harvest"] = [NSString stringWithFormat:@"%@ days.", harvest.text];
    
    //Get Germination Days
    NSString *germString = germination.text;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *germNumber = [f numberFromString:germString];
    postEvent[@"germDate"] = germNumber;
    
    //Get Transplant Days
    NSString *tranString = transplant.text;
    NSNumberFormatter *f1 = [[NSNumberFormatter alloc] init];
    [f1 setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *tranNumb = [f1 numberFromString:tranString];
    postEvent[@"tranDate"] = tranNumb;
    
    //Get Harvest Days
    NSString *havString = harvest.text;
    NSNumberFormatter *f2 = [[NSNumberFormatter alloc] init];
    [f2 setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *havNumb = [f2 numberFromString:havString];
    postEvent[@"harvDate"] = havNumb;
    
    //Saving Image
    NSData *imageData = UIImageJPEGRepresentation(imageView.image, 0.5f);
    PFFile *pfFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@.png", plantName.text] data:imageData];
    [pfFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            postEvent[@"image"] = pfFile;
            
            [postEvent saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSLog(@"Saved");
                }
                else{
                    // Error
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
    }];
    
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

- (IBAction)category:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 17:
            if (!vegCheck) {
                [vegetable setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [herb setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [fruit setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                vegCheck = YES;
                herbCheck = NO;
                fruitCheck = NO;
            }
            else if (vegCheck){
                [vegetable setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                vegCheck = NO;
                herbCheck = NO;
                fruitCheck = NO;
            }
            break;
        case 18:
            if (!herbCheck) {
                [herb setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [vegetable setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [fruit setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                herbCheck = YES;
                vegCheck = NO;
                fruitCheck = NO;
            }
            else if (herbCheck){
                [herb setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                herbCheck = NO;
                vegCheck = NO;
                fruitCheck = NO;
            }
            break;
        case 19:
            if (!fruitCheck) {
                [fruit setImage:[UIImage imageNamed:@"cBoxG.png"] forState:UIControlStateNormal];
                [vegetable setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                [herb setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fruitCheck = YES;
                vegCheck = NO;
                herbCheck = NO;
            }
            else if (fruitCheck){
                [fruit setImage:[UIImage imageNamed:@"cBox.png"] forState:UIControlStateNormal];
                fruitCheck = NO;
                vegCheck = NO;
                herbCheck = NO;
            }
            break;
            
        default:
            break;
    }
}

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
    if ([plantName.text isEqual:@""]) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Plant Name Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (vegCheck == NO && herbCheck == NO && fruitCheck == NO){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"A Category is Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([plantDetails.text isEqual:@""] || [plantDetails.text isEqualToString:@"Details about the plant will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Plant Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (fullCheck == NO && fullParCheck == NO && parCheck == NO) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Sun is Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (normCheck == NO && lowCheck == NO){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Watering is Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([soil.text isEqual:@""] || [soil.text isEqualToString:@"Details about the soil will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Soil Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([timeToPlant.text isEqual:@""] || [timeToPlant.text isEqualToString:@"Details about when to plant will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Best Time To Plant Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([spacing.text isEqual:@""] || [spacing.text isEqualToString:@"Details about spacing will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Spacing Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([container.text isEqual:@""] || [container.text isEqualToString:@"Details about container size will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Container Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([height.text isEqual:@""] || [height.text isEqualToString:@"Details about plant height will go here..."]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Height Details Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([germination.text isEqual:@""]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Germination Days are Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([transplant.text isEqual:@""]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Transplant Days are Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if ([harvest.text isEqual:@""]){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Harvest Days are Required!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (imageView.image == nil){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"A photo is required for this plant", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    } else if (![plantName.text isEqual:@""] && ![plantDetails.text isEqual:@""] && ![plantDetails.text isEqualToString:@"Details about the plant will go here..."] && ![soil.text isEqual:@""] && ![soil.text isEqualToString:@"Details about the soil will go here..."] && ![timeToPlant.text isEqual:@""] && ![timeToPlant.text isEqualToString:@"Details about when to plant will go here..."] && ![spacing.text isEqual:@""] && ![spacing.text isEqualToString:@"Details about spacing will go here..."] && ![container.text isEqual:@""] && ![container.text isEqualToString:@"Details about container size will go here..."] && ![height.text isEqual:@""] && ![height.text isEqualToString:@"Details about plant height will go here..."] && (vegCheck == YES || herbCheck == YES || fruitCheck == YES) && (fullCheck == YES || fullParCheck == YES || parCheck == YES) && (normCheck == YES || lowCheck == YES) && ![germination.text isEqual:@""] && ![transplant.text isEqual:@""] && ![harvest.text isEqual:@""] && !(imageView.image == nil)){
        if ([PFUser currentUser]) {
            UIAlertView *addToGarden = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Are you sure you want to add this item to the list?"] message:nil delegate:self cancelButtonTitle:@"Add" otherButtonTitles:@"Cancel", nil];
            
            [addToGarden show];
        } else {
        }
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
