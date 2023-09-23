/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#if FLEXLAYOUT_SWIFT_PACKAGE
#import <yoga/Yoga.h>
#else
#import "Yoga.h"
#endif
#import "YGLayout.h"

@interface YGLayout ()

@property(nonatomic, assign, readonly) YGNodeRef node;

- (instancetype)initWithView:(UIView*)view;

@end
