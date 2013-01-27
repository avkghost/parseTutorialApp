//
//  PTASignUpViewController.m
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import "PTASignUpViewController.h"
#import <Parse/Parse.h>

@interface PTASignUpViewController ()

@end

@implementation PTASignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignUpPressed:(id)sender
{
    [self.tfUserName resignFirstResponder];
    [self.tfPassword resignFirstResponder];
    
    // SignUP action
    PFUser *user = [PFUser user];
    
    user.username = self.tfUserName.text;
    user.password = self.tfPassword.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (nil == error) {

            [self performSegueWithIdentifier:@"SignUpSuccesful" sender:self];
            
        } else {
            // Error handling
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                       message:errorString
                                      delegate:nil
                             cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil] show];
        }
    }];
}
@end
