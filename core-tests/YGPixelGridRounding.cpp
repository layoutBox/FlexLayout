#include <gtest/gtest.h>
#include <yoga/Yoga.h>

// This tests
TEST(YogaTest, pixel_grid_rounding_table) {
  const float kPointScale = 3;

  const YGConfigRef config = YGConfigNew();
  YGConfigSetPointScaleFactor(config, kPointScale);

  const float kSeparatorHeight = 1 / kPointScale;
  const float kCellContentHeight = 100.5;
  const int kCellsCount = 100;

  const YGNodeRef root = YGNodeNewWithConfig(config);

  int subnodesCount = 0;

  for (int i = 0; i < kCellsCount; i++) {
    const YGNodeRef separator = YGNodeNewWithConfig(config);
    YGNodeStyleSetHeight(separator, kSeparatorHeight);
    YGNodeInsertChild(root, separator, subnodesCount++);

    const YGNodeRef cell = YGNodeNewWithConfig(config);
    YGNodeSetNodeType(cell, YGNodeTypeText);
    YGNodeStyleSetHeight(cell, kCellContentHeight);
    YGNodeInsertChild(root, cell, subnodesCount++);
  }

  const YGNodeRef separator = YGNodeNewWithConfig(config);
  YGNodeStyleSetHeight(separator, kSeparatorHeight);
  YGNodeInsertChild(root, separator, subnodesCount++);

  YGNodeCalculateLayout(root, 375, YGUndefined, YGDirectionLTR);

  EXPECT_LE(kCellsCount * (kSeparatorHeight + kCellContentHeight) + kSeparatorHeight, YGNodeLayoutGetHeight(root));
  EXPECT_FLOAT_EQ(375, YGNodeLayoutGetWidth(root));

  for (int i = 0; i < YGNodeGetChildCount(root); i++) {
    const YGNodeRef child = YGNodeGetChild(root, i);
    const float childHeight = YGNodeLayoutGetHeight(child);

    if (YGNodeGetNodeType(child) == YGNodeTypeText) {
      EXPECT_GT(childHeight, kCellContentHeight);
    } else {
      EXPECT_GT(childHeight, 0);
    }
  }

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}
