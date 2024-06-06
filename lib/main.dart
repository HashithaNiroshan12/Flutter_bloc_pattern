import 'package:bloc_pattern_flutter/logic/cubit/counter_cubit_cubit.dart';
import 'package:bloc_pattern_flutter/presentation/screens/counter_page.dart';
import 'package:bloc_pattern_flutter/presentation/screens/second_sccreen.dart';
import 'package:bloc_pattern_flutter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterCubitState counterCubitState1 =
      CounterCubitState(counterValue: 1);
  final CounterCubitState counterCubitState2 =
      CounterCubitState(counterValue: 1);

  print(counterCubitState1 == counterCubitState2);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final CounterCubitCubit _counterCubit = CounterCubitCubit();
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: CounterPage(
                title: 'HomeScreen',
                color: Colors.blueAccent,
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                title: 'Second Screen',
                color: Colors.redAccent,
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdPage(
                title: 'Third Screen',
                color: Colors.greenAccent,
              ),
            ),
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterCubit.close();
    super.dispose();
  }
}
