#include <cstdio>

using namespace std;

template <typename T> 
class Bst {
public:
  Bst(T value) : value_(value) { left_ = right_ = 0; }
  ~Bst() {
    delete left_;
    delete right_;
  }

  void insert(T value) {
    if (value < value_) {
      left_ = createOrInsert(left_, value);
    } else if (value > value_) {
      right_ = createOrInsert(right_, value);
    }
  }

  bool contains(T value) {
    if (value == value_) {
      return true;
    } else if (value < value_ && left_ != NULL) {
      return left_->contains(value);
    } else if (value > value_ && right_ != NULL) {
      return right_->contains(value);
    }

    return false;
  }

  T value() { return value_; }
  Bst<T>* left() { return left_; }
  Bst<T>* right() { return right_; }

private:
  Bst<T>* createOrInsert(Bst<T>* node, T value) {
    if (!node) {
      node = new Bst<T>(value);
    } else {
      node->insert(value);
    }

    return node;
  }

  T value_;
  Bst<T>* left_;
  Bst<T>* right_;
};
