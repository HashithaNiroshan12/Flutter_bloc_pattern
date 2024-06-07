import 'package:bloc_pattern_flutter/logic/cubit/counter_cubit_cubit.dart';
import 'package:bloc_pattern_flutter/presentation/screens/counter_page.dart';
import 'package:bloc_pattern_flutter/presentation/screens/second_sccreen.dart';
import 'package:bloc_pattern_flutter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubitCubit _counterCubit = CounterCubitCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const CounterPage(
                    title: 'HomeScreen',
                    color: Colors.blueAccent,
                  ),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: 'Second Screen',
                    color: Colors.redAccent,
                  ),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdPage(
                    title: 'THirs Screen',
                    color: Colors.greenAccent,
                  ),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
