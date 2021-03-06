//
//  PTAUploadImageViewController.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVKPlacholderTextView;

@interface PTAUploadImageViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnSelectPicture;
@property (weak, nonatomic) IBOutlet UIImageView *ivPreview;
@property (weak, nonatomic) IBOutlet AVKPlacholderTextView *tvComment;

- (IBAction)btnSelectPicturePressed:(UIButton *)sender;
- (IBAction)btnSendPressed:(UIBarButtonItem *)sender;

@end
