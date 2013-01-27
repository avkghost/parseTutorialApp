//
//  AVKPlacholderTextView.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVKPlacholderTextView : UITextView
{
    BOOL _shouldDrawPlaceholder;
}

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

@end
