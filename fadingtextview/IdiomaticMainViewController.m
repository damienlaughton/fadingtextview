//
//  IdiomaticMainViewController.m
//  fadingtextview
//
//  Created by Damien Laughton on 31/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import "IdiomaticMainViewController.h"
#import "FadingTextView.h"
#import "FadingContentScrollView.h"

@implementation IdiomaticMainViewController

@synthesize ftv = ftv_;
@synthesize fcsv1 = fcsv1_;
@synthesize fcsv2 = fcsv2_;
@synthesize fcsv3 = fcsv3_;
@synthesize fcsv4 = fcsv4_;

#pragma mark -
#pragma mark Properties

-(FadingTextView*)ftv {
    if (ftv_ == nil) {
        UIColor* baseColor = [UIColor colorWithRed:0.64f green:0.01f blue:0.31f alpha:1.0f];
        UIColor* textColor = [UIColor colorWithRed:0.97f green:0.96f blue:0.91f alpha:1.0f];
    
        ftv_ = [[FadingTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) baseColor:baseColor andTextColor:textColor];
    }
    return ftv_;
}

-(FadingContentScrollView*)fcsv1 {
    if (fcsv1_ == nil) {
        fcsv1_ = [[FadingContentScrollView alloc] initWithFrame:CGRectMake(50, 100, 300, 400) contentView:_contentView1 andBaseColor:[UIColor redColor]];
    }
    return fcsv1_;
}

-(FadingContentScrollView*)fcsv2 {
    if (fcsv2_ == nil) {
        fcsv2_ = [[FadingContentScrollView alloc] initWithFrame:CGRectMake(450, 150, 300, 300) contentView:_contentView2 andBaseColor:[UIColor blueColor]];
    }
    return fcsv2_;
}

-(FadingContentScrollView*)fcsv3 {
    if (fcsv3_ == nil) {
        fcsv3_ = [[FadingContentScrollView alloc] initWithFrame:CGRectMake(75, 550, 250, 250) contentView:_contentView3 baseColor:[UIColor redColor] andFadeOrientation:FADE_LEFTNRIGHT];
    }
    return fcsv3_;
}

-(FadingContentScrollView*)fcsv4 {
    if (fcsv4_ == nil) {
        fcsv4_ = [[FadingContentScrollView alloc] initWithFrame:CGRectMake(400, 500, 325, 250) contentView:_contentView4 baseColor:[UIColor blueColor] andFadeOrientation:FADE_TOPNBOTTOM];
    }
    return fcsv4_;
}

#pragma mark -
#pragma mark Class Lifecycle

-(void)dealloc {
    self.ftv = nil;
    self.fcsv1 = nil;
    self.fcsv2 = nil;
    self.fcsv3 = nil;
    self.fcsv4 = nil;
    [super dealloc];
}

-(NSString*)nibName {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return @"IdiomaticMainViewController_iPhone";
    } else {
        return @"IdiomaticMainViewController_iPad";
    }
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self.view addSubview:self.ftv.view];
    } else {
        [self.view addSubview:self.fcsv1.view];
        [self.view addSubview:self.fcsv2.view];
        [self.view addSubview:self.fcsv3.view];
        [self.view addSubview:self.fcsv4.view];
    }
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
