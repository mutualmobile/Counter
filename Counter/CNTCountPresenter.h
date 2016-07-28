//
//  CNTCountPresenter.h
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNTCountView.h"
#import "CNTCountInteractorIO.h"


@interface CNTCountPresenter : NSObject <CNTCountInteractorOutput>
@property (nonatomic, weak)     id<CNTCountView>            view;
@property (nonatomic, strong)   id<CNTCountInteractorInput> interactor;

- (void)updateView;
- (void)increment;
- (void)decrement;
@end
