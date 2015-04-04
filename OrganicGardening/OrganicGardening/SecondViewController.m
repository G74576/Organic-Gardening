//
//  SecondViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/17/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)takePhoto:(id)sender{
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [imageView setImage:image];
    [takeButton setTitle:@"Retake Photo" forState:UIControlStateNormal];
    clearButton.hidden = NO;
    faceBookButton.hidden = NO;
    twitterButton.hidden = NO;
    share.hidden = NO;
    message.hidden = YES;
    //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);   This will save image to photo album
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)clearPhoto:(id)sender{
    imageView.image = nil;
    clearButton.hidden = YES;
    faceBookButton.hidden = YES;
    twitterButton.hidden = YES;
    share.hidden = YES;
    message.hidden = NO;
    [takeButton setTitle:@"Take Photo" forState:UIControlStateNormal];
}

-(void)postFacebook:(id)sender{
//    UIAlertView *postFB = [[UIAlertView alloc]initWithTitle:@"Post Image to Facebook" message:@"This will be utilized to post this image to Facebook wall." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
//    
//    [postFB show];
    
    slcompose = [[SLComposeViewController alloc]init];
    slcompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [slcompose setInitialText:[NSString stringWithFormat:@""]];
    [slcompose addImage:imageView.image];
    [self presentViewController:slcompose animated:YES completion:NULL];
        
}

-(void)postToTwitter:(id)sender{
    
    slcompose = [[SLComposeViewController alloc]init];
    slcompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [slcompose setInitialText:[NSString stringWithFormat:@""]];
    [slcompose addImage:imageView.image];
    [self presentViewController:slcompose animated:YES completion:NULL];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"OK"]) {
        imageView.image = nil;
        clearButton.hidden = YES;
        faceBookButton.hidden = YES;
        twitterButton.hidden = YES;
        share.hidden = YES;
        message.hidden = NO;
        [takeButton setTitle:@"Take Photo" forState:UIControlStateNormal];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
}

@end
