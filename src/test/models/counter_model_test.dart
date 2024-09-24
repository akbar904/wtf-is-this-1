import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterModel', () {
    test('should create a CounterModel with an initial value', () {
      final counter = CounterModel(value: 0);
      expect(counter.value, 0);
    });

    test('should serialize to JSON correctly', () {
      final counter = CounterModel(value: 10);
      final json = counter.toJson();
      expect(json, {'value': 10});
    });

    test('should deserialize from JSON correctly', () {
      final json = {'value': 5};
      final counter = CounterModel.fromJson(json);
      expect(counter.value, 5);
    });

    test('should correctly update the counter value', () {
      final counter = CounterModel(value: 0);
      counter.value = 3;
      expect(counter.value, 3);
    });
  });
}
