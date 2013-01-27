//
//  AVKViewController.m
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import "PTASignInViewController.h"
#import <Parse/Parse.h>

@interface PTASignInViewController ()

@end

@implementation PTASignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
            toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)btnSignInPressed:(UIButton *)sender
{
    // Sign In Action
    [self.tfUserName resignFirstResponder];
    [self.tfPassword resignFirstResponder];
    
    [PFUser logInWithUsernameInBackground:self.tfUserName.text
                                 password:self.tfPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (nil == error) {
                                            
                                            [self performSegueWithIdentifier:@"SignInSuccesful" sender:self];
                                            
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
