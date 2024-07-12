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
