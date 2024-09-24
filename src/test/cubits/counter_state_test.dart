
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/cubits/counter_state.dart';

void main() {
	group('CounterState', () {
		test('initial state should have counter value of 0', () {
			final state = CounterState();
			expect(state.counter, 0);
		});

		test('should correctly serialize and deserialize from JSON', () {
			final state = CounterState(counter: 5);
			final json = state.toJson();
			expect(json, {'counter': 5});

			final newState = CounterState.fromJson(json);
			expect(newState.counter, 5);
		});
	});
}
