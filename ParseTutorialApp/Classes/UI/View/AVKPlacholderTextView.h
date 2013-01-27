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
@private
    BOOL _drawPlaceholder;
    NSArray *_observingProperties;
}

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

- (void)initialize;

@end
