import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(5);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void incrementBy(int value) => emit(state + value);
}