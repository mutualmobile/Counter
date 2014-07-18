//
//  CACountViewController.h
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CACountView.h"

@class CNTCountPresenter;


@interface CACountViewController : UIViewController <CACountView>
@property (nonatomic, weak) IBOutlet    UILabel*    countLabel;
@property (nonatomic, weak) IBOutlet    UIButton*   decrementButton;
@property (nonatomic, weak) IBOutlet    UIButton*   incrementButton;

@property (nonatomic, strong)   CNTCountPresenter*  presenter;
@end
