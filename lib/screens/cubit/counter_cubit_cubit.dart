import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubitCubit extends Cubit<CounterCubitState> {
  CounterCubitCubit() : super(CounterCubitState(counterValue: 0));

  void increment() => emit(CounterCubitState(counterValue: state.counterValue! + 1,wasIncremented: true));

  void decreement() => emit(CounterCubitState(counterValue: state.counterValue! - 1,wasIncremented: false));
}
