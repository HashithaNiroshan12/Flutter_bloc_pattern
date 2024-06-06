import 'package:bloc_pattern_flutter/presentation/screens/second_sccreen.dart';
import 'package:bloc_pattern_flutter/screens/counter/counter_bloc.dart';
import 'package:bloc_pattern_flutter/screens/counter/counter_event.dart';
import 'package:bloc_pattern_flutter/logic/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubitCubit, CounterCubitState>(
              listener: (context, state) {
                if (state.wasIncremented! == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 8),
                  ));
                } else if (state.wasIncremented! == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Decremeted"),
                    duration: Duration(milliseconds: 8),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue! < 0) {
                  return Text(
                    'BRR ,NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue! % 2 == 0) {
                  return Text(
                    'YAAY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue! == 5) {
                  return Text(
                    'HMM, Number  ${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
                color:Colors.redAccent,
                child: Text('Go to Second Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                }),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
                color: Colors.greenAccent,
                child: Text('Go to Second Screen'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: Text('${widget.title} #1'),
            onPressed: () {
              BlocProvider.of<CounterCubitCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: Text('${widget.title} '),
            onPressed: () {
              BlocProvider.of<CounterCubitCubit>(context).decreement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
