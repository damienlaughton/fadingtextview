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
    UIColor* baseColor_;
    UIColor* textColor_;
    CGRect textViewFrame_;
    
    UITextView* IBOutlet _textView;
    UIView* IBOutlet _topFadingView;
    UIView* IBOutlet _bottomFadingView;
    
    CAGradientLayer *g1_;
    CAGradientLayer *g2_;
}

@property (nonatomic, retain) UIColor* fadeColor;
@property (nonatomic, retain) UIColor* baseColor;
@property (nonatomic, retain) UIColor* textColor;
@property CGRect textViewFrame;

@property (nonatomic, retain) UITextView* textView;
@property (nonatomic, retain) UIView* topFadingView;
@property (nonatomic, retain) UIView* bottomFadingView;

@property (nonatomic, retain) CAGradientLayer *g1;
@property (nonatomic, retain) CAGradientLayer *g2;

-(id)initWithFrame:(CGRect)frame andBaseColor:(UIColor*)baseColor;
-(id)initWithFrame:(CGRect)frame baseColor:(UIColor*)baseColor andTextColor:(UIColor*)textColor;

-(void)resizeFadeLayer;

@end
