/**
 * Copyright (c) 2014-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "YGLayout.h"
#if FLEXLAYOUT_SWIFT_PACKAGE
#import <yoga/Yoga.h>
#else
#import "Yoga.h"
#endif

@interface YGLayout ()

@property (nonatomic, assign, readonly) YGNodeRef node;

- (instancetype)initWithView:(UIView *)view;

@end
