//
//  CNTCountInteractorIO.h
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CNTCountInteractorInput <NSObject>
- (void)requestCount;
- (void)increment;
- (void)decrement;
@end


@protocol CNTCountInteractorOutput <NSObject>
- (void)updateCount:(NSUInteger)count;
@end
