/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#pragma once

#include "Yoga.h"

#include "Debug_AssertFatal.h"
#include "Enums_Dimension.h"
#include "Enums_Direction.h"
#include "Enums_Edge.h"
#include "Enums_FlexDirection.h"
#include "Enums_PhysicalEdge.h"

namespace facebook::yoga {

inline bool isRow(const FlexDirection flexDirection) {
  return flexDirection == FlexDirection::Row ||
      flexDirection == FlexDirection::RowReverse;
}

inline bool isColumn(const FlexDirection flexDirection) {
  return flexDirection == FlexDirection::Column ||
      flexDirection == FlexDirection::ColumnReverse;
}

inline FlexDirection resolveDirection(
    const FlexDirection flexDirection,
    const Direction direction) {
  if (direction == Direction::RTL) {
    if (flexDirection == FlexDirection::Row) {
      return FlexDirection::RowReverse;
    } else if (flexDirection == FlexDirection::RowReverse) {
      return FlexDirection::Row;
    }
  }

  return flexDirection;
}

inline FlexDirection resolveCrossDirection(
    const FlexDirection flexDirection,
    const Direction direction) {
  return isColumn(flexDirection)
      ? resolveDirection(FlexDirection::Row, direction)
      : FlexDirection::Column;
}

inline PhysicalEdge flexStartEdge(FlexDirection flexDirection) {
  switch (flexDirection) {
    case FlexDirection::Column:
      return PhysicalEdge::Top;
    case FlexDirection::ColumnReverse:
      return PhysicalEdge::Bottom;
    case FlexDirection::Row:
      return PhysicalEdge::Left;
    case FlexDirection::RowReverse:
      return PhysicalEdge::Right;
  }

  fatalWithMessage("Invalid FlexDirection");
}

inline PhysicalEdge flexEndEdge(FlexDirection flexDirection) {
  switch (flexDirection) {
    case FlexDirection::Column:
      return PhysicalEdge::Bottom;
    case FlexDirection::ColumnReverse:
      return PhysicalEdge::Top;
    case FlexDirection::Row:
      return PhysicalEdge::Right;
    case FlexDirection::RowReverse:
      return PhysicalEdge::Left;
  }

  fatalWithMessage("Invalid FlexDirection");
}

inline PhysicalEdge inlineStartEdge(
    FlexDirection flexDirection,
    Direction direction) {
  if (isRow(flexDirection)) {
    return direction == Direction::RTL ? PhysicalEdge::Right
                                       : PhysicalEdge::Left;
  }

  return PhysicalEdge::Top;
}

inline PhysicalEdge inlineEndEdge(
    FlexDirection flexDirection,
    Direction direction) {
  if (isRow(flexDirection)) {
    return direction == Direction::RTL ? PhysicalEdge::Left
                                       : PhysicalEdge::Right;
  }

  return PhysicalEdge::Bottom;
}

inline Dimension dimension(FlexDirection flexDirection) {
  switch (flexDirection) {
    case FlexDirection::Column:
      return Dimension::Height;
    case FlexDirection::ColumnReverse:
      return Dimension::Height;
    case FlexDirection::Row:
      return Dimension::Width;
    case FlexDirection::RowReverse:
      return Dimension::Width;
  }

  fatalWithMessage("Invalid FlexDirection");
}

} // namespace facebook::yoga
