//
//  CACountInteractorIO.h
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CACountInteractorInput <NSObject>
- (void)requestCount;
- (void)increment;
- (void)decrement;
@end


@protocol CACountInteractorOutput <NSObject>
@optional
- (void)updateCount:(NSUInteger)count;
@end
