part of 'counter_cubit_cubit.dart';

// ignore: must_be_immutable
class CounterCubitState extends Equatable {
  final int? counterValue;
  final bool? wasIncremented;

   CounterCubitState({@required this.counterValue, this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
