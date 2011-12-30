//
//  FadingTextView.m
//  fadingtextview
//
//  Created by Damien Laughton on 30/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import "FadingTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FadingTextView

@synthesize fadeColor = fadeColor_;
@synthesize baseColor = baseColor_;
@synthesize textColor = textColor_;

@synthesize textViewFrame = textViewFrame_;
@synthesize textView = _textView;
@synthesize topFadingView = _topFadingView;
@synthesize bottomFadingView = _bottomFadingView;

-(void)dealloc {
    self.fadeColor = nil;
    self.baseColor = nil;
    self.textColor = nil;
}

-(id)initWithFrame:(CGRect)frame baseColor:(UIColor*)baseColor andTextColor:(UIColor*)textColor {
    self = [super init];
    if (self) {
        self.textViewFrame = frame;
        self.baseColor = baseColor;
        self.textColor = textColor;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andBaseColor:(UIColor*)baseColor {
//    self = [super init];
//    if (self) {
//        self.textViewFrame = frame;
//        self.baseColor = baseColor;
//    }
//    return self;
    return [self initWithFrame:frame baseColor:baseColor andTextColor:[UIColor whiteColor]];
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

#pragma mark - View lifecycle

-(UIColor*)fadeColor {
    if (fadeColor_ == nil) {
        const CGFloat* components = CGColorGetComponents(self.baseColor.CGColor);
        fadeColor_ = [[UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:CGColorGetAlpha(self.baseColor.CGColor)*.1] retain];
    }
    return fadeColor_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    self.view.frame = self.textViewFrame;
    self.textView.frame = self.textViewFrame;
    float fadingViewsHeight = self.textViewFrame.size.height * 0.05;
    

    CGRect topFrame = self.textViewFrame;
    topFrame.size.height = fadingViewsHeight;
    self.topFadingView.frame = topFrame;
    
    CGRect bottomFrame = self.textViewFrame;
    bottomFrame.size.height = fadingViewsHeight;
    bottomFrame.origin.y = bottomFrame.origin.y + self.textViewFrame.size.height - fadingViewsHeight;
    self.bottomFadingView.frame = bottomFrame;
    
    CAGradientLayer *g1 = [CAGradientLayer layer];
    g1.frame = self.topFadingView.bounds;
    g1.colors = [NSArray arrayWithObjects:(id)[self.baseColor CGColor], (id)[self.fadeColor CGColor], nil];
    [self.topFadingView.layer insertSublayer:g1 atIndex:0];
    
    CAGradientLayer *g2 = [CAGradientLayer layer];
    g2.frame = self.topFadingView.bounds;
    g2.colors = [NSArray arrayWithObjects: (id)[self.fadeColor CGColor],(id)[self.baseColor CGColor], nil];
    [self.bottomFadingView.layer insertSublayer:g2 atIndex:0];
    
    self.textView.backgroundColor = self.baseColor;
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
