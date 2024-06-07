import 'package:bloc_pattern_flutter/logic/cubit/counter_cubit_cubit.dart';
import 'package:bloc_pattern_flutter/presentation/routes/app_router.dart';
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

final AppRouter _appRouter = AppRouter();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _appRouter.dispose();
    super.dispose();
  }
}
