//
//  FadingContentScrollView.h
//  fadingtextview
//
//  Created by Damien Laughton on 31/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum _fade_orientation {
    FADE_TOPNBOTTOM = 0,
    FADE_LEFTNRIGHT
} fade_orientation;

@interface FadingContentScrollView : UIViewController {
    UIColor* fadeColor_;
    UIColor* baseColor_;
    CGRect scrollViewFrame_;
    UIView* contentView_;
    
    UIScrollView* IBOutlet _scrollView;
    UIView* IBOutlet _topFadingView;
    UIView* IBOutlet _bottomFadingView;
    
    CAGradientLayer *g1_; // 
    CAGradientLayer *g2_;
    
    fade_orientation fadeOrientation_;

}

@property (nonatomic, retain) UIColor* fadeColor;
@property (nonatomic, retain) UIColor* baseColor;
@property (nonatomic, assign) CGRect scrollViewFrame;
@property (nonatomic, retain) UIView* contentView;

@property (nonatomic, retain) UIScrollView* scrollView;
@property (nonatomic, retain) UIView* topFadingView;

@property (nonatomic, retain) CAGradientLayer *g1;
@property (nonatomic, retain) CAGradientLayer *g2;
@property (nonatomic, retain) UIView* bottomFadingView;

@property (nonatomic, assign) fade_orientation fadeOrientation;

-(id)initWithFrame:(CGRect)frame contentView:(UIView*)contentView andBaseColor:(UIColor*)baseColor;
-(id)initWithFrame:(CGRect)frame contentView:(UIView*)contentView baseColor:(UIColor*)baseColor andFadeOrientation:(fade_orientation)fadeOrientation;

@end
