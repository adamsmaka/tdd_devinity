// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_devinity/app/core/enums.dart';
import 'package:tdd_devinity/features/counter/cubit/counter_cubit.dart';
import 'package:tdd_devinity/features/counter/data/counter_data_source.dart';
import 'package:tdd_devinity/features/counter/domain/repository/counter_repository.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(CounterRepository(CounterDataSource())),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'You have pushed the button this many times:',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 128),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
