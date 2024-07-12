import 'dart:async';

class CounterStream {
  final _counterStreamController = StreamController<int>();

  int _counter = 0;

  Stream<int> get counter {
    // stream - bu ma'lumot
    return _counterStreamController.stream;
  }

  void decrement() {
    _counterStreamController.add(_counter--);
  }

  void increment() {
    _counterStreamController.add(_counter++);
  }
}
