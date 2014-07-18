//
//  CNTCountView.h
//  Counter
//
//  Created by Jeff Gilbert on 8/23/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CNTCountView <NSObject>
- (void)setCountText:(NSString*)countText;
- (void)setDecrementEnabled:(BOOL)enabled;
@end
