// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

part of 'counter_cubit.dart';

class CounterState {
  CounterState({
    this.value = 0,
    this.status = Status.initial,
  });
  final int value;
  final Status status;
}
