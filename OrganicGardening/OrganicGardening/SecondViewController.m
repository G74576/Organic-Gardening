//
//  SecondViewController.m
//  OrganicGardening
//
//  Created by Kevin O'Toole on 3/17/15.
//  Copyright (c) 2015 Kevin O'Toole. All rights reserved.
//

#import "SecondViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize library;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.library = [[ALAssetsLibrary alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Take a Photo
//UIImagePickerController for taking a photo
-(void)takePhoto:(id)sender{
    picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info valueForKey:UIImagePickerControllerOriginalImage];
    //image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [imageView setImage:image];
    takeButton.hidden = YES;
    retakeButton.hidden = NO;
    clearButton.hidden = NO;
    saveButton.hidden = NO;
    faceBookButton.hidden = NO;
    twitterButton.hidden = NO;
    headerback.hidden = YES;
    header.hidden = YES;

    //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);   This will save image to photo album
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)clearPhoto:(id)sender{
    imageView.image = nil;
    takeButton.hidden = NO;
    retakeButton.hidden = YES;
    saveButton.hidden = YES;
    clearButton.hidden = YES;
    faceBookButton.hidden = YES;
    twitterButton.hidden = YES;
    header.hidden = NO;
    headerback.hidden = NO;
}

-(void)savePhoto:(id)sender{
    UIAlertView *saveImage = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Save Image?"] message:@"Save image to your photo library?" delegate:self cancelButtonTitle:@"Save" otherButtonTitles:@"Cancel", nil];
    
    [saveImage show];
}


//*** This code creates a custom album in the users photo libray with the name of the app. ***

#define PHOTO_ALBUM_NAME @"Organic Gardening"

-(void)saveAssetToAlbum:(UIImage*)myPhoto
{
    PHPhotoLibrary* photoLib = [PHPhotoLibrary sharedPhotoLibrary];
    
    [photoLib performChanges:^
     {
         PHAssetCollectionChangeRequest* collectionRequest;
         
         PHFetchOptions *options = [[PHFetchOptions alloc] init];
         options.predicate = [NSPredicate predicateWithFormat:@"title = %@", PHOTO_ALBUM_NAME];
         
         PHFetchResult* fetchCollectionResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:options];
         
         // Create a new album
         if (fetchCollectionResult.count==0)
         {
             NSLog(@"Creating a new album.");
             collectionRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:PHOTO_ALBUM_NAME];
         }
         
         // Use existing album
         else
         {
             NSLog(@"Fetching existing album, of #%lu albums found.", (unsigned long)fetchCollectionResult.count);
             
             PHAssetCollection* exisitingCollection = fetchCollectionResult.firstObject;
             
             collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:exisitingCollection];
         }
         
         PHAssetChangeRequest* createAssetRequest;
         createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:myPhoto];
         [collectionRequest addAssets:@[createAssetRequest.placeholderForCreatedAsset]];
     }
           completionHandler:^(BOOL success, NSError *error)
     {
         if (success)
         {
             NSLog(@"added image to album:%@", PHOTO_ALBUM_NAME);
         }
         else
             NSLog(@"Error adding image to album: %@", error);
         
     }];
}

#pragma mark Post to Facebook / Twitter
-(void)postFacebook:(id)sender{
    slcompose = [[SLComposeViewController alloc]init];
    slcompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [slcompose setInitialText:[NSString stringWithFormat:@""]];
    [slcompose addImage:imageView.image];
    [slcompose setCompletionHandler:^(SLComposeViewControllerResult result){
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                //do something
                break;
            case SLComposeViewControllerResultDone:
                //do something here is where we will save image to photo album - post to parse also to pull down for image gallery.  Allow user to be able to then click to share with all users if choose to.
                //[self saveAssetToAlbum:image];
                break;
            default:
                break;
        }
    }];
    [self presentViewController:slcompose animated:YES completion:NULL];
}

-(void)postToTwitter:(id)sender{

    slcompose = [[SLComposeViewController alloc]init];
    slcompose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [slcompose setInitialText:[NSString stringWithFormat:@""]];
    [slcompose addImage:imageView.image];
    [slcompose setCompletionHandler:^(SLComposeViewControllerResult result){
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                //do something
                break;
            case SLComposeViewControllerResultDone:
                //do something  here is where we will save image to photo album - post to parse also to pull down for image gallery.  Allow user to be able to then click to share with all users if choose to.
                
                //[self saveAssetToAlbum:image];
                break;
            default:
                break;
        }
    }];
    [self presentViewController:slcompose animated:YES completion:NULL];
}


#pragma mark AlertView for buttons
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Save"]) {
        
        [self saveAssetToAlbum:image];
        imageView.image = nil;
        takeButton.hidden = NO;
        retakeButton.hidden = YES;
        saveButton.hidden = YES;
        clearButton.hidden = YES;
        faceBookButton.hidden = YES;
        twitterButton.hidden = YES;
        header.hidden = NO;
        headerback.hidden = NO;
        [[[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Image Saved"]
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
    else if ([title isEqualToString:@"Cancel"]){
        
    }
}

@end
