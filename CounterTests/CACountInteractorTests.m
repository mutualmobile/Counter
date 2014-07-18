//
//  Counter - CACountInteractorTests.m
//  Copyright 2013 Mutual Mobile. All rights reserved.
//
//  Created by: Jeff Gilbert
//

// Class under test
#import "CACountInteractor.h"

// Test support
#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import "OCHamcrest.h"


#define assertCountEquals(expected) assertThatUnsignedInteger(self.count, equalToUnsignedInteger(expected))


@interface CACountInteractorTests : SenTestCase <CNTCountInteractorOutput>
@property (nonatomic, strong)   id<CNTCountInteractorInput>  interactor;
@property (nonatomic, assign)   NSUInteger                  count;
@end


@implementation CACountInteractorTests

- (void)setUp
{
    [super setUp];
    
    CACountInteractor* interactor = [[CACountInteractor alloc] init];
    interactor.output = self;
    self.interactor = interactor;
}


- (void)testInitialCountIsZero
{
    self.count = 1;
    
    [self.interactor requestCount];
    
    assertCountEquals(0);
}


- (void)testOneIncrementReturnsOne
{
    [self.interactor increment];
    
    assertCountEquals(1);
}


- (void)testTwoIncrementsReturnsTwo
{
    [self.interactor increment];
    [self.interactor increment];
    
    assertCountEquals(2);
}


- (void)testDecrementFromZeroReturnsZero
{
	[self.interactor decrement];
    
	assertCountEquals(0);
}


- (void)testOneDecrementFromOneReturnsZero
{
	[self.interactor increment];
    
	[self.interactor decrement];
    
	assertCountEquals(0);
}


- (void)testOneDecrementFromTwoReturnsOne
{
	[self.interactor increment];
    [self.interactor increment];
    
	[self.interactor decrement];
    
	assertCountEquals(1);
}


#pragma mark - Interactor Output

- (void)updateCount:(NSUInteger)count
{
    self.count = count;
}

@end
