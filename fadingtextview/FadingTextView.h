//
//  FadingTextView.h
//  fadingtextview
//
//  Created by Damien Laughton on 30/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FadingTextView : UIViewController {
    UIColor* fadeColor_;
    CGRect textViewFrame_;
    
    UITextView* IBOutlet _textView;
    UIView* IBOutlet _topFadingView;
    UIView* IBOutlet _bottomFadingView;
}

@property (nonatomic, retain) UIColor* fadeColor;
@property CGRect textViewFrame;

@property (nonatomic, retain) UITextView* textView;
@property (nonatomic, retain) UIView* topFadingView;
@property (nonatomic, retain) UIView* bottomFadingView;

-(id)initWithFrame:(CGRect)frame andFadeColor:(UIColor*)fadeColor;

@end
