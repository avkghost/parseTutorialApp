//
//  PTASignUpViewController.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTASignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;


- (IBAction)btnSignUpPressed:(id)sender;
@end
