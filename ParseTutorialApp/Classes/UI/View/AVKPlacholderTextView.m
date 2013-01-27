//
//  AVKPlacholderTextView.m
//  ParseTutorialApp
//
//  Created by Andrey Kozeletsky on 1/27/13.
//  Copyright (c) 2013 AVKSoftware. All rights reserved.
//

#import "AVKPlacholderTextView.h"
#import "config.h"

@interface AVKPlacholderTextView()

- (void)_textDidChanged:(NSNotification *)aNotification;
- (void)_updateDrawPlaceholder;

@end

@implementation AVKPlacholderTextView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // Initialization code
        [self initialize];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initialize];
    }
    
    return self;
}

- (void)awakeFromNib
{
    // TODO: If needed
}

- (void)dealloc
{
#if !__has_feature(objc_arc)
    [_observingProperties release];
    
    [self.placeholder release];
    [self.placeholderColor release];
#endif
    
    _observingProperties = nil;
    
    self.placeholder = nil;
    self.placeholderColor = nil;
    
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    if (_drawPlaceholder)
    {
        [self.placeholderColor set];
        [self.placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.f, self.frame.size.height - 16.f)
                            withFont:self.font];
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    @try {
        if (nil != newSuperview) {
            
            for (NSString *keyPath in _observingProperties) {
                [self addObserver:self
                       forKeyPath:keyPath
                          options:NSKeyValueObservingOptionNew
                          context:nil];
            }
            
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(_textDidChanged:)
                                                         name:UITextViewTextDidChangeNotification
                                                       object:self];
            
        } else {
            
            for (NSString *keyPath in _observingProperties) {
                [self removeObserver:self
                          forKeyPath:keyPath];
            }
            
            [[NSNotificationCenter defaultCenter] removeObserver:self
                                                            name:UITextViewTextDidChangeNotification
                                                          object:self];
            
        }
    }
    @catch (NSException *exception) {
        LogError(@"newSuperview: %@\nexception: %@", newSuperview, exception);
    }
}



#pragma mark - Accessors

- (void)setPlaceholder:(NSString *)aPlaceholder
{
    if (![aPlaceholder isEqualToString:_placeholder]) {
        
        _placeholder = aPlaceholder;
        
    }
}

- (void)setPlaceholderColor:(UIColor *)aPlaceholderColor
{
    if (![aPlaceholderColor isEqual:_placeholderColor]) {
        
        _placeholderColor = aPlaceholderColor;
        
    }
}

#pragma mark - Public methods

- (void)initialize
{
    _observingProperties = [NSArray arrayWithObjects:
                            @"font",
                            @"placeholder",
                            @"placeholderColor",
                            @"text",
                            nil];
    
    self.placeholderColor = [UIColor lightGrayColor];
    _drawPlaceholder = NO;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([self isObservingProperty:keyPath])
    {
        
        [self _updateDrawPlaceholder];

        return;
    }

    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (BOOL)isObservingProperty:(NSString *)aPropertyName
{
    BOOL result = NO;

    @try
    {
        result = (NSNotFound != [_observingProperties indexOfObject:aPropertyName]);
    }
    @catch (NSException *exception)
    {
        LogError(@"aPropertyName: %@\nexception: %@", aPropertyName, exception);
    }
    @finally
    {
        return result;
    }
}

#pragma mark - Private methods

- (void)_textDidChanged:(NSNotification *)aNotification
{
    [self _updateDrawPlaceholder];
}

- (void)_updateDrawPlaceholder
{
    BOOL prev = _drawPlaceholder;
    _drawPlaceholder = self.placeholder && self.placeholderColor && self.text.length == 0;
    
    if (prev != _drawPlaceholder) {
        [self setNeedsDisplay];
    }

}

@end
