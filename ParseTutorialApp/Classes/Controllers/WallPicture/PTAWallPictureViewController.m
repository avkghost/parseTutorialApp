//
//  PTAWallPictureViewController.m
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import "PTAWallPictureViewController.h"
#import <Parse/Parse.h>

@interface PTAWallPictureViewController ()

@end

@implementation PTAWallPictureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.svWall.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self performSelector:@selector(reload)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)btnSignOutPressed:(UIBarButtonItem *)sender
{
    // Sign Out Action
    [PFUser logOut];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Public methods

- (void)configureViews
{
    
    if ([self.svWall.subviews count]) {
        [self.svWall.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    //For every wall element, put a view in the scroll
    int originY = 10;
    
    for (PFObject *wallObject in self.wallObjects){
        
        //Build the view with the image and the comments
        UIView *wallImageView = [[UIView alloc] initWithFrame:CGRectMake(10, originY, self.view.frame.size.width - 20 , 300)];
        
        //Add the image
        PFFile *image = (PFFile *)[wallObject objectForKey:@"image"];
        UIImageView *userImage = [[UIImageView alloc] initWithImage:[UIImage imageWithData:image.getData]];
        userImage.frame = CGRectMake(0, 0, wallImageView.frame.size.width, 200);
        [wallImageView addSubview:userImage];
        
        //Add the info label (User and creation date)
        NSDate *creationDate = wallObject.createdAt;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"HH:mm dd/MM yyyy"];
        
        UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 210, wallImageView.frame.size.width,15)];
        infoLabel.text = [NSString stringWithFormat:@"Uploaded by: %@, %@", [wallObject objectForKey:@"user"], [df stringFromDate:creationDate]];
        infoLabel.font = [UIFont fontWithName:@"Arial-ItalicMT" size:9];
        infoLabel.textColor = [UIColor whiteColor];
        infoLabel.backgroundColor = [UIColor clearColor];
        [wallImageView addSubview:infoLabel];
        
        //Add the comment
        UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, wallImageView.frame.size.width, 15)];
        commentLabel.text = [wallObject objectForKey:@"comment"];
        commentLabel.font = [UIFont fontWithName:@"ArialMT" size:13];
        commentLabel.textColor = [UIColor whiteColor];
        commentLabel.backgroundColor = [UIColor clearColor];
        [wallImageView addSubview:commentLabel];
        
        [self.svWall addSubview:wallImageView];
        
        originY = originY + wallImageView.frame.size.width + 20;
        
    }
    
    //7
    //Set the bounds of the scroll
    self.svWall.contentSize = CGSizeMake(self.svWall.frame.size.width, originY);
}

- (void)reload
{
    //Prepare the query to get all the images in descending order
    PFQuery *query = [PFQuery queryWithClassName:@"WallImageObject"];
    
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            
            //Everything was correct, put the new objects and load the wall
            self.wallObjects = nil;
            self.wallObjects = [[NSArray alloc] initWithArray:objects];
            
            [self configureViews];
            
        } else {
            
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}

@end
