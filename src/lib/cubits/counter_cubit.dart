import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() {
    emit(CounterState(counter: state.counter + 2));
  }

  void decrement() {
    emit(CounterState(counter: state.counter - 1));
  }
}
