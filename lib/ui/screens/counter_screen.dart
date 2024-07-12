import 'package:dars76_bloc_1qism/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final counterCubit = context.read<CounterCubit>();
    // BlocProvider.of<CounterCubit>(context);
    // print(counterCubit.state);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            icon: Icon(Icons.remove_circle),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
