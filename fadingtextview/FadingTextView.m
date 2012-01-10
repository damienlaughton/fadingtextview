//
//  FadingTextView.m
//  fadingtextview
//
//  Created by Damien Laughton on 30/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import "FadingTextView.h"


@implementation FadingTextView

@synthesize fadeColor = fadeColor_;
@synthesize baseColor = baseColor_;
@synthesize textColor = textColor_;

@synthesize textViewFrame = textViewFrame_;
@synthesize textView = _textView;
@synthesize topFadingView = _topFadingView;
@synthesize bottomFadingView = _bottomFadingView;

@synthesize g1 = g1_;
@synthesize g2 = g2_;

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

-(void)setTextViewFrame:(CGRect)textViewFrame {
    textViewFrame_ = textViewFrame;
    self.view.frame = textViewFrame_;
    
    CGRect tvFrame = self.view.frame;
    tvFrame.origin.x = 0;
    tvFrame.origin.y = 0;
    self.textView.frame = tvFrame;
    
    float fadingViewsHeight = self.textViewFrame.size.height * 0.05;
    
    CGRect topFrame = tvFrame;
    topFrame.size.height = fadingViewsHeight;
    self.topFadingView.frame = topFrame;
    
    CGRect bottomFrame = tvFrame;
    bottomFrame.size.height = fadingViewsHeight;
    bottomFrame.origin.y = bottomFrame.origin.y + tvFrame.size.height - fadingViewsHeight;
    self.bottomFadingView.frame = bottomFrame;
    
    self.g1.frame = self.topFadingView.frame;
    self.g2.frame = self.topFadingView.frame;
    
}

-(CAGradientLayer*)g1 {
    if (g1_ == nil) {
        g1_ = [[CAGradientLayer layer] retain];
        g1_.colors = [NSArray arrayWithObjects:(id)[self.baseColor CGColor], (id)[self.fadeColor CGColor], nil];
    }
    return g1_;
}

-(CAGradientLayer*)g2 {
    if (g2_ == nil) {
        g2_ = [[CAGradientLayer layer] retain];
        g2_.colors = [NSArray arrayWithObjects: (id)[self.fadeColor CGColor],(id)[self.baseColor CGColor], nil];
    }
    return g2_;
}

#pragma mark -
#pragma mark Class Lifecycle

-(void)dealloc {
    self.fadeColor = nil;
    self.baseColor = nil;
    self.textColor = nil;
    
    self.g1 = nil;
    self.g2 = nil;
}

-(id)initWithFrame:(CGRect)frame baseColor:(UIColor*)baseColor andTextColor:(UIColor*)textColor {
    self = [super init];
    if (self) {
        
        self.baseColor = baseColor;
        self.textColor = textColor;
        self.textViewFrame = frame;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andBaseColor:(UIColor*)baseColor {
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

#pragma mark -
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.topFadingView.layer insertSublayer:self.g1 atIndex:0];
    
    [self.bottomFadingView.layer insertSublayer:self.g2 atIndex:0];
    
    self.textView.backgroundColor = self.baseColor;
    self.textView.textColor = self.textColor;
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
