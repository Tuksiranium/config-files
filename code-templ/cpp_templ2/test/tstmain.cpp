#include <gtest/gtest.h>
#include "add.hpp"

TEST(test1, testun) {
    EXPECT_EQ(3 * 7, 21);
}

TEST(test_add, add_work) {
    EXPECT_EQ(add(2, 2), 4);
    EXPECT_EQ(add(-2, 2), 0);
    EXPECT_EQ(add(-2, -2), -4);
    EXPECT_EQ(add(2, -2), 0);
}
