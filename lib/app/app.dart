// Copyright (c) 2023, Adam Smaka
// https://smaka.dev

import 'package:flutter/material.dart';
import 'package:tdd_devinity/features/counter/presentation/counter_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 32,
          ),
          headlineMedium: TextStyle(
            fontSize: 64,
          ),
        ),
      ),
      home: const CounterPage(),
    );
  }
}
