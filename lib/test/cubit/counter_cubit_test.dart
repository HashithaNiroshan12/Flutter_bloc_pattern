import 'package:bloc_pattern_flutter/screens/cubit/counter_cubit_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubit', () {
    CounterCubitCubit? counterCubitCubit;
    setUp(() {
      counterCubitCubit = CounterCubitCubit();
    });
    tearDown(() {
      counterCubitCubit?.close();
    });

    test(
        "the initial state for the CounterCubit is counterState(CoujnterValue: 0)",
        () {
      expect(counterCubitCubit?.state, CounterCubitState(counterValue: 0));
    });

    blocTest(
      'the cubit should emit a CoiunterState(coujnter value:1,wasIncremented:true)when cubit.incerment() function is called',
      build: () => counterCubitCubit!,
      act: (cubit) => cubit.increment(),
      expect: ()=>[ CounterCubitState(counterValue: 1, wasIncremented: true)],
      
    );

     blocTest(
      'the cubit should emit a CoiunterState(coujnter value:1,wasIncremented:false)when cubit.decrement() function is called',
      build: () => counterCubitCubit!,
      act: (cubit) => cubit.decreement(),
      expect: ()=>[ CounterCubitState(counterValue: -1, wasIncremented: false)],
      
    );
  });
}
