//
//  CACountInteractor.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountInteractor.h"


@interface CNTCountInteractor()
@property (nonatomic, assign)   NSUInteger  count;
@end

@implementation CNTCountInteractor

- (void)requestCount
{
    [self sendCount];
}


- (void)increment
{
    NSLog(@"Interactor incrementing");
    ++self.count;
    [self sendCount];
}


- (void)decrement
{
    NSLog(@"Interactor check for decrement");
	if ([self canDecrement])
	{
        NSLog(@"Interactor decrementing");
        --self.count;
        [self sendCount];
    }
}


- (BOOL)canDecrement
{
	return (self.count > 0);
}


- (void)sendCount
{
    NSLog(@"Interactor sending data to presenter via router");
    [self.output updateCount:self.count];
}

@end
