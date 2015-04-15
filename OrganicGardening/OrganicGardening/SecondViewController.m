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
//*** When the user saves a pic it saves to the album that was created, however if the user closes the app and restarts it, when they save the photo it then creates a duplicate folder with the same name as the previous one! Need to figure out why.. ***


//#define PHOTO_ALBUM_NAME @"Organic Gardening"
//
//NSString* existingAlbumIdentifier = nil;
//
//-(void)saveAssetToAlbum:(UIImage*)myPhoto
//{
//    PHPhotoLibrary* photoLib = [PHPhotoLibrary sharedPhotoLibrary];
//    
//    __block NSString* albumIdentifier = existingAlbumIdentifier;
//    __block PHAssetCollectionChangeRequest* collectionRequest;
//    
//    [photoLib performChanges:^
//     {
//         PHFetchResult* fetchCollectionResult;
//         if ( albumIdentifier )
//             fetchCollectionResult = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[albumIdentifier] options:nil];
//         
//         // Create a new album
//         if ( !fetchCollectionResult || fetchCollectionResult.count==0 )
//         {
//             NSLog(@"Creating a new album.");
//             collectionRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:PHOTO_ALBUM_NAME];
//             albumIdentifier = collectionRequest.placeholderForCreatedAssetCollection.localIdentifier;
//         }
//         // Use existing album
//         else
//         {
//             NSLog(@"Fetching existing album, of #%lu albums found.", (unsigned long)fetchCollectionResult.count);
//             PHAssetCollection* exisitingCollection = fetchCollectionResult.firstObject;
//             collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:exisitingCollection];
//         }
//         
//         NSLog(@"Album local identifier = %@", albumIdentifier);
//         
//         PHAssetChangeRequest* createAssetRequest;
//         createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:myPhoto];
//         
//         [collectionRequest addAssets:@[createAssetRequest.placeholderForCreatedAsset]];
//     }
//           completionHandler:^(BOOL success, NSError *error)
//     {
//         if (success)
//         {
//             existingAlbumIdentifier = albumIdentifier;
//             NSLog(@"added image to album:%@", PHOTO_ALBUM_NAME);
//         }
//         else
//             NSLog(@"Error adding image to  album: %@", error);
//     }];
//}

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
                break;
            default:
                break;
        }
    }];
    [self presentViewController:slcompose animated:YES completion:NULL];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"Save"]) {
        
        //[self saveAssetToAlbum:image];
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
