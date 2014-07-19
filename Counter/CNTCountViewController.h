//
//  CNTCountViewController.h
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNTCountView.h"

@class CNTCountPresenter;


@interface CNTCountViewController : UIViewController <CNTCountView>
@property (nonatomic, weak) IBOutlet    UILabel*    countLabel;
@property (nonatomic, weak) IBOutlet    UIButton*   decrementButton;
@property (nonatomic, weak) IBOutlet    UIButton*   incrementButton;

@property (nonatomic, strong)   CNTCountPresenter*  presenter;
@end
