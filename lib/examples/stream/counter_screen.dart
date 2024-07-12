import 'package:dars76_bloc_1qism/examples/stream/counter_stream.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final counterStream = CounterStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              counterStream.decrement();
            },
            icon: Icon(Icons.remove_circle),
          ),
          IconButton(
            onPressed: () {
              counterStream.increment();
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
      body: StreamBuilder<int>(
          stream: counterStream.counter,
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }

            final counter = snapshot.data;
            return Center(
              child: Text(
                counter.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }
}
