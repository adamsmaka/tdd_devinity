// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

import 'package:tdd_devinity/features/counter/data/counter_data_source.dart';

class CounterRepository {
  CounterRepository(this._dataSource);

  final CounterDataSource _dataSource;

  Future<int> increaseValue() {
    return _dataSource.increaseValue();
  }
}
