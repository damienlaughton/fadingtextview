//
//  FadingContentScrollView.m
//  fadingtextview
//
//  Created by Damien Laughton on 31/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import "FadingContentScrollView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FadingContentScrollView

@synthesize fadeColor = fadeColor_;
@synthesize baseColor = baseColor_;
@synthesize scrollViewFrame = scrollViewFrame_;
@synthesize contentView = contentView_;

@synthesize scrollView = _scrollView;
@synthesize topFadingView = _topFadingView;
@synthesize bottomFadingView = _bottomFadingView;

@synthesize g1 = g1_;
@synthesize g2 = g2_;

@synthesize fadeOrientation = fadeOrientation_;

#pragma mark -
#pragma mark Properties

//Sets fadeColor to be 10% alpha of baseColor
-(UIColor*)fadeColor {
    if (fadeColor_ == nil) {
        const CGFloat* components = CGColorGetComponents(self.baseColor.CGColor);
        fadeColor_ = [[UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:CGColorGetAlpha(self.baseColor.CGColor)*.1] retain];
    }
    return fadeColor_;
}


-(CAGradientLayer*)g1 {
    if (g1_ == nil) {
        g1_ = [[CAGradientLayer layer] retain];
        
        if (self.fadeOrientation == FADE_LEFTNRIGHT) {
            g1_.startPoint = CGPointMake(0, 0.5);
            g1_.endPoint = CGPointMake(1.0, 0.5);            
        }

        g1_.colors = [NSArray arrayWithObjects:(id)[self.baseColor CGColor], (id)[self.fadeColor CGColor], nil];
    }
    return g1_;
}

-(CAGradientLayer*)g2 {
    if (g2_ == nil) {
        g2_ = [[CAGradientLayer layer] retain];
        
        if (self.fadeOrientation == FADE_LEFTNRIGHT) {
            g2_.startPoint = CGPointMake(0, 0.5);
            g2_.endPoint = CGPointMake(1.0, 0.5);            
        }
        
        g2_.colors = [NSArray arrayWithObjects: (id)[self.fadeColor CGColor],(id)[self.baseColor CGColor], nil];
    }
    return g2_;
}


-(void)setScrollViewFrame:(CGRect)scrollViewFrame {
    scrollViewFrame_ = scrollViewFrame;
    self.view.frame = scrollViewFrame_;
    
    if (self.fadeOrientation == FADE_TOPNBOTTOM) {
    
        CGRect csvFrame = self.view.frame;
        csvFrame.origin.x = 0;
        csvFrame.origin.y = 0;    
        self.scrollView.frame = csvFrame;
        
        float fadingViewsHeight = self.scrollViewFrame.size.height * 0.05;
        
        CGRect topFrame = csvFrame;
        topFrame.size.height = fadingViewsHeight;
        self.topFadingView.frame = topFrame;
        
        CGRect bottomFrame = csvFrame;
        bottomFrame.size.height = fadingViewsHeight;
        bottomFrame.origin.y = bottomFrame.origin.y + csvFrame.size.height - fadingViewsHeight;
        self.bottomFadingView.frame = bottomFrame;
        
        //both the layers cover the full extent of their frames
        //so they start at {0,0}
        self.g1.frame = self.topFadingView.frame;
        self.g2.frame = self.topFadingView.frame;
        
    } else  { // (self.fadeOrientation == FADE_LEFTNRIGHT)
        
        CGRect csvFrame = self.view.frame;
        csvFrame.origin.x = 0;
        csvFrame.origin.y = 0;    
        self.scrollView.frame = csvFrame;
        
        float fadingViewsWidth = self.scrollViewFrame.size.width * 0.05;
        
        CGRect leftFrame = csvFrame;
        leftFrame.size.width = fadingViewsWidth;
        self.topFadingView.frame = leftFrame;
        
        CGRect rightFrame = csvFrame;
        rightFrame.size.height = fadingViewsWidth;
        rightFrame.origin.x = rightFrame.origin.x + csvFrame.size.width - fadingViewsWidth;
        self.bottomFadingView.frame = rightFrame;
        
        //both the layers cover the full extent of their frames
        //so they start at {0,0}
        self.g1.frame = self.topFadingView.frame;
        self.g2.frame = self.topFadingView.frame;

    }
    
}



#pragma mark -
#pragma mark Class Lifecycle

-(void)dealloc {
    self.fadeColor = nil;
    self.baseColor = nil;
    self.contentView = nil;
    
    self.g1 = nil;
    self.g2 = nil;
}

-(id)initWithFrame:(CGRect)frame contentView:(UIView*)contentView baseColor:(UIColor*)baseColor andFadeOrientation:(fade_orientation)fadeOrientation {
    self = [super init];
    if (self) {
        self.contentView = contentView;
        self.baseColor = baseColor;
        self.fadeOrientation = fadeOrientation;
        self.scrollViewFrame = frame;
        
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame contentView:(UIView*)contentView andBaseColor:(UIColor*)baseColor {

    return [self initWithFrame:frame contentView:contentView baseColor:baseColor andFadeOrientation:FADE_TOPNBOTTOM];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.topFadingView.layer insertSublayer:self.g1 atIndex:0];
    
    [self.bottomFadingView.layer insertSublayer:self.g2 atIndex:0];
    
    self.scrollView.backgroundColor = self.baseColor;
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:self.contentView];
    [self.scrollView setContentSize:self.contentView.frame.size];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
