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