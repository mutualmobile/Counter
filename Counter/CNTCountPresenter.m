//
//  CACountPresenter.m
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTCountPresenter.h"


@interface CNTCountPresenter()
@property (nonatomic, strong)   NSNumberFormatter*  countFormatter;
@end


@implementation CNTCountPresenter

- (void)updateView
{
    NSLog(@"Presenter ask interactor about data");
    [self.interactor requestCount];
}


- (void)increment
{
    NSLog(@"Presenter get that");
    [self.interactor increment];
}


- (void)decrement
{
    NSLog(@"Presenter get that");
    [self.interactor decrement];
}


- (NSNumberFormatter*)countFormatter
{
    if (_countFormatter == nil)
    {
        _countFormatter = [[NSNumberFormatter alloc] init];
        [_countFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    }
    
    return _countFormatter;
}


#pragma mark - Interactor output

- (void)updateCount:(NSUInteger)count
{
    NSLog(@"Presenter requesting to data base for string of counter");
    NSString *countText = [self formattedCount:count];
    NSLog(@"Presenter updating view");
    [self.view setCountText:countText];
    NSLog(@"Presenter tell view that he can check for enable decrement");
    [self.view setDecrementEnabled:[self canDecrementCount:count]];
}


- (NSString*)formattedCount:(NSUInteger)count
{
    return [self.countFormatter stringFromNumber:@(count)];
}


- (BOOL)canDecrementCount:(NSUInteger)count
{
    return (count > 0);
}

@end
