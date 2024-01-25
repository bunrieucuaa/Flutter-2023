class MyObject {
  int value;

  MyObject({required this.value});
  // phương thức tăng giá trị
  void increase() {
    value++;
  }

  //phương thức  giảm giá trị
  void decrease() {
    value--;
  }

  // phương thức trả về giá trị
  int get() {
    return value;
  }

// set giá trị cho value
  void set(int value) {
    this.value = value;
  }
}
