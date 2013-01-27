//
//  PTAWallPictureViewController.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTAWallPictureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *svWall;
@property (nonatomic, strong) NSArray *wallObjects;

- (IBAction)btnSignOutPressed:(UIBarButtonItem *)sender;

@end
