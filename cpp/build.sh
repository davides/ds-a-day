#!/bin/bash

# To set up googletest, from ${GTEST_DIR}:
#
# g++ -isystem ./include -I. -pthread -c ./src/gtest-all.cc
# g++ -isystem ./include -I. -pthread -c ./src/gtest_main.cc
# ar -rv libgtest.a gtest-all.o
# ar -rv libgtest_main.a gtest_main.o

g++ bst_unittest.cc -isystem ${GTEST_DIR}/include -c bst_unittest.cc

g++ bst_unittest.o ${GTEST_DIR}/libgtest.a ${GTEST_DIR}/libgtest_main.a -lpthread -o bst_unittest.out

./bst_unittest.out
