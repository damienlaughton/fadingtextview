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
    FadingContentScrollView* fcsv_;
    
    UIView* IBOutlet _contentView;
}

@property (nonatomic, retain) FadingTextView* ftv;
@property (nonatomic, retain) FadingContentScrollView* fcsv;
@end
