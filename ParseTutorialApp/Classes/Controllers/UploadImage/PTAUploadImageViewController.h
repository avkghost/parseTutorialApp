//
//  PTAUploadImageViewController.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTAUploadImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnSelectPicture;
@property (weak, nonatomic) IBOutlet UIImageView *ivPreview;


- (IBAction)btnSelectPicturePressed:(UIButton *)sender;
- (IBAction)btnSendPressed:(UIBarButtonItem *)sender;
@end
