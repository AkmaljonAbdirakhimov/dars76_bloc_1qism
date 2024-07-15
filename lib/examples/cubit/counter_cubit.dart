import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void decrement() {
    // int newValue = state - 1;

    emit(state - 1);
  }

  void increment() {
    emit(state + 1);
  }
}

abstract class Animal {
  void eat();
}

// Single level inheritance - nasil olish
class Dog extends Animal {
  String _name = "John Doe";

  String get name {
    return _name;
  }

  set newName(String name) {
    _name = name;
  }

  @override
  void eat() {
    print("O'tlar");
  }
}

// Hierarchy level inheritance - nasil olish
class Cat extends Animal {
  @override
  void eat() {
    print("Go'shtlar");
  }
}

// Hierarchy level inheritance - nasil olish
class Bird extends Animal {
  @override
  void eat() {
    print("Donlar");
  }
}

// Multi Hierarychy inheritance
class Dalmatin extends Dog {}


// Multilevel inheritance 
// class Burgut extends Bird, Animal {}