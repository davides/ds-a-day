#include "bst.h"
#include "gtest/gtest.h"

TEST(insert, lesser) {
  Bst<int> b(2);

  b.insert(1);

  ASSERT_TRUE(b.left() != NULL);
  ASSERT_TRUE(b.right() == NULL);
}

TEST(insert, lesserTwice) {
  Bst<int> b(2);
  b.insert(1);
  b.insert(0);

  ASSERT_TRUE(b.left() != NULL);
  ASSERT_TRUE(b.left()->left() != NULL);
}

TEST(insert, lesserThenGreater) {
  Bst<int> b(3);
  b.insert(1);
  b.insert(2);

  ASSERT_TRUE(b.right() == NULL);
  ASSERT_TRUE(b.left() && b.left()->value() == 1);
  ASSERT_TRUE(b.left()->right() && b.left()->right()->value() == 2);
}

TEST(insert, greater) {
  Bst<int> b(2);
  b.insert(3);

  ASSERT_TRUE(b.left() == NULL);
  ASSERT_TRUE(b.right() != NULL);
}

TEST(insert, greaterTwice) {
  Bst<int> b(2);
  b.insert(3);
  b.insert(4);

  ASSERT_TRUE(b.right() != NULL);
  ASSERT_TRUE(b.right()->right() != NULL);
}

TEST(insert, greaterThenLesser) {
  Bst<int> b(3);
  b.insert(5);
  b.insert(4);

  ASSERT_TRUE(b.left() == NULL);
  ASSERT_TRUE(b.right() && b.right()->value() == 5);
  ASSERT_TRUE(b.right()->left() && b.right()->left()->value() == 4);
}

TEST(contains, returnsExistingValues) {
  int valueCount = 4;
  int values[4] = { 1, 5, 2, 4 };
  
  Bst<int> b(3);
  for (int i = 0; i < valueCount; ++i) {
    b.insert(values[i]);
  }

  ASSERT_TRUE(b.contains(3));
  for (int i = 0; i < valueCount; ++i) {
    ASSERT_TRUE(b.contains(values[i]));
  }
}