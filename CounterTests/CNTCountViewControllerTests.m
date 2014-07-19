//
//  Counter - CACountViewControllerTests.m
//  Copyright 2013 Mutual Mobile. All rights reserved.
//
//  Created by: Jeff Gilbert
//

// Class under test
#import "CNTCountViewController.h"

// Collaborators
#import "CNTCountPresenter.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import "OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito.h"


#define assertCountTextEquals(expected) assertThat(self.view.countLabel.text, equalTo(expected))
#define assertDecrementButtonEnabledEquals(expected) assertThatBool(self.view.decrementButton.enabled, equalToBool(expected))


@interface CNTCountViewControllerTests : SenTestCase
@property (nonatomic, strong)   CNTCountViewController* view;
@property (nonatomic, strong)   CNTCountPresenter*      presenter;
@end


@implementation CNTCountViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.view = [[CNTCountViewController alloc] init];
    [self.view view];   // force the view to load
    
    self.presenter = mock([CNTCountPresenter class]);
    self.view.presenter = self.presenter;
}


- (void)testInitialState
{
    assertThat(self.view.countLabel.text, nilValue());
    assertThatBool(self.view.decrementButton.enabled, equalToBool(YES));
}


- (void)testSetCountTextToZero
{
	[self.view setCountText:@"zero"];
    
	assertCountTextEquals(@"zero");
}


- (void)testSetCountTextToOne
{
	[self.view setCountText:@"one"];
    
	assertCountTextEquals(@"one");
}


- (void)testDisableDecrement
{
    [self.view setDecrementEnabled:NO];
    
    assertDecrementButtonEnabledEquals(NO);
}


- (void)testEnableDecrement
{
    [self setDecrementButtonEnabled:NO];
    
    [self.view setDecrementEnabled:YES];
    
    assertDecrementButtonEnabledEquals(YES);
}


- (void)testViewAppearingRequestsViewUpdate
{
    [self.view viewWillAppear:YES];
    
    [verify(self.presenter) updateView];
}


- (void)testIncrementButtonRequestsIncrement
{
    [self tapButton:self.view.incrementButton];

    [verify(self.presenter) increment];
}


- (void)testDecrementButtonRequestsDecrement
{
    [self tapButton:self.view.decrementButton];
    
    [verify(self.presenter) decrement];
}


#pragma mark -

- (void)setDecrementButtonEnabled:(BOOL)enabled
{
    self.view.decrementButton.enabled = enabled;
}


- (void)tapButton:(UIButton*)button
{
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
