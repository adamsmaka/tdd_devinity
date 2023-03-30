// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

import 'package:bloc/bloc.dart';
import 'package:tdd_devinity/app/core/enums.dart';
import 'package:tdd_devinity/features/counter/domain/repository/counter_repository.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this._counterRepository) : super(CounterState());

  final CounterRepository _counterRepository;

  Future<void> increment() async {
    emit(CounterState(
      value: state.value,
      status: Status.loading,
    ));
    try {
      final newValue = await _counterRepository.increaseValue();
      emit(
        CounterState(
          value: newValue,
          status: Status.success,
        ),
      );
    } catch (exception) {
      emit(
        CounterState(
          value: state.value,
          status: Status.error,
        ),
      );
    }
  }
}
