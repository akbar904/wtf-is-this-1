import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/cubits/counter_cubit.dart';
import 'package:my_flutter_app/cubits/counter_state.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('initial state is CounterState with counter value 0', () {
      expect(counterCubit.state, equals(CounterState(counter: 0)));
    });

    blocTest<CounterCubit, CounterState>(
      'emits [CounterState(counter: 1)] when increment is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counter: 1)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [CounterState(counter: -1)] when decrement is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counter: -1)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [CounterState(counter: 1), CounterState(counter: 2)] when increment is called twice',
      build: () => counterCubit,
      act: (cubit) => cubit
        ..increment()
        ..increment(),
      expect: () => [CounterState(counter: 1), CounterState(counter: 2)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [CounterState(counter: -1), CounterState(counter: -2)] when decrement is called twice',
      build: () => counterCubit,
      act: (cubit) => cubit
        ..decrement()
        ..decrement(),
      expect: () => [CounterState(counter: -1), CounterState(counter: -2)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [CounterState(counter: 1), CounterState(counter: 0)] when increment and then decrement is called',
      build: () => counterCubit,
      act: (cubit) => cubit
        ..increment()
        ..decrement(),
      expect: () => [CounterState(counter: 1), CounterState(counter: 0)],
    );
  });
}
