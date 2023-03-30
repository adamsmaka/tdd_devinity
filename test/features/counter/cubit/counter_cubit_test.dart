// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

// will be called CounterCubit
// will have injected CounterRepository
// will have initial state with value 0 and status initial
// will have event called `increment`
// verify calls repository increaseValue once
// on success - emits [Status.loading] then [Status.success]
// on success - emits value from repository
// on error - emits [Status.loading] then [Status.error]

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_devinity/app/core/enums.dart';
import 'package:tdd_devinity/features/counter/cubit/counter_cubit.dart';
import 'package:tdd_devinity/features/counter/domain/repository/counter_repository.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late CounterCubit sut;
  late CounterRepository repository;

  setUp(() {
    repository = MockCounterRepository();
    sut = CounterCubit(repository);
  });

  test('has expected initial state', () {
    expect(
      sut.state,
      CounterState(value: 0, status: Status.initial),
    );
  });

  group('increment', () {
    blocTest(
      'verify repository call',
      setUp: () {
        when(() => repository.increaseValue()).thenAnswer((_) async => 8);
      },
      build: () => sut,
      act: (cubit) => cubit.increment(),
      verify: (_) {
        verify(() => repository.increaseValue()).called(1);
      },
    );

    group('on success', () {
      blocTest(
        'emits [Status.loading] then [Status.success]',
        setUp: () {
          when(() => repository.increaseValue()).thenAnswer((_) async => 8);
        },
        build: () => sut,
        act: (cubit) => cubit.increment(),
        expect: () => [
          isA<CounterState>()
              .having((state) => state.status, 'status', Status.loading),
          isA<CounterState>()
              .having((state) => state.status, 'status', Status.success),
        ],
      );

      blocTest(
        'emits value from repository',
        setUp: () {
          when(() => repository.increaseValue()).thenAnswer((_) async => 8);
        },
        build: () => sut,
        act: (cubit) => cubit.increment(),
        skip: 1, // <--- NEW
        expect: () => [
          isA<CounterState>().having((state) => state.value, 'value', 8),
        ],
      );
    });

    group('on error', () {
      blocTest(
        'emits [Status.loading] then [Status.error]',
        setUp: () {
          when(() => repository.increaseValue()).thenThrow(Exception('oops'));
        },
        build: () => sut,
        act: (cubit) => cubit.increment(),
        expect: () => [
          isA<CounterState>()
              .having((state) => state.status, 'status', Status.loading),
          isA<CounterState>()
              .having((state) => state.status, 'status', Status.error),
        ],
      );
    });
  });
}
