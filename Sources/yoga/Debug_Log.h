/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include "Yoga.h"

#include "Config_Config.h"
#include "Enums_LogLevel.h"
#include "Node_Node.h"

namespace facebook::yoga {

void log(LogLevel level, const char* format, ...) noexcept;

void log(
    const yoga::Node* node,
    LogLevel level,
    const char* message,
    ...) noexcept;

void log(
    const yoga::Config* config,
    LogLevel level,
    const char* format,
    ...) noexcept;

YGLogger getDefaultLogger();

} // namespace facebook::yoga
