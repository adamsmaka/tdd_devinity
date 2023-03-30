// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

class CounterDataSource {
  int _value = 0;
  int get value => _value;
  Future<int> increaseValue() async {
    await Future.delayed(const Duration(seconds: 1));
    _value += 1;
    return value;
  }
}
