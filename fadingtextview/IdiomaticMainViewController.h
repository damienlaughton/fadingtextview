//
//  IdiomaticMainViewController.h
//  fadingtextview
//
//  Created by Damien Laughton on 31/12/2011.
//  Copyright (c) 2011 Mobilology Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FadingTextView;
@class FadingContentScrollView;

@interface IdiomaticMainViewController : UIViewController {
    FadingTextView* ftv_;
    FadingContentScrollView* fcsv1_;
    FadingContentScrollView* fcsv2_;
    FadingContentScrollView* fcsv3_;
    FadingContentScrollView* fcsv4_;
    
    UIView* IBOutlet _contentView1;
    UIView* IBOutlet _contentView2;
    UIView* IBOutlet _contentView3;
    UIView* IBOutlet _contentView4;
}

@property (nonatomic, retain) FadingTextView* ftv;
@property (nonatomic, retain) FadingContentScrollView* fcsv1;
@property (nonatomic, retain) FadingContentScrollView* fcsv2;
@property (nonatomic, retain) FadingContentScrollView* fcsv3;
@property (nonatomic, retain) FadingContentScrollView* fcsv4;
@end
