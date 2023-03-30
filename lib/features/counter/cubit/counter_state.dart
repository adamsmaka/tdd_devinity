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

  @override
  bool operator ==(covariant CounterState other) {
    if (identical(this, other)) return true;

    return other.value == value && other.status == status;
  }

  @override
  int get hashCode => value.hashCode ^ status.hashCode;

  @override
  String toString() => 'CounterState(value: $value, status: $status)';
}
