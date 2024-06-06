
import 'package:bloc_pattern_flutter/screens/cubit/counter_cubit_cubit.dart';
import 'package:bloc_pattern_flutter/screens/cubit/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterCubitState counterCubitState1 = CounterCubitState(counterValue: 1);
  final CounterCubitState counterCubitState2 = CounterCubitState(counterValue: 1);

  print(counterCubitState1 == counterCubitState2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubitCubit>(
      create: (context) => CounterCubitCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(title: 'Flutter Bloc Pattern Counter'),
      ),
    );
  }
}
