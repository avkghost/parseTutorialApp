//
//  AVKPlacholderTextView.h
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//
//  This is a part of AVKSoftware's framework
//
//  AVKSoftware's framework is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import <UIKit/UIKit.h>

@interface AVKPlacholderTextView : UITextView
{
@private
    BOOL _drawPlaceholder;
    NSArray *_observingProperties;
}

#if __has_feature(objc_arc)
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
#else
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;
#endif


- (void)initialize;

@end
