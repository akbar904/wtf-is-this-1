
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/screens/home_screen.dart';

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays counter value', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => MockCounterCubit(),
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('increments counter when increment button is pressed', (WidgetTester tester) async {
			final mockCubit = MockCounterCubit();
			when(() => mockCubit.state).thenReturn(CounterState(1));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => mockCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.add));
			await tester.pump();

			verify(() => mockCubit.increment()).called(1);
		});

		testWidgets('decrements counter when decrement button is pressed', (WidgetTester tester) async {
			final mockCubit = MockCounterCubit();
			when(() => mockCubit.state).thenReturn(CounterState(-1));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (context) => mockCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.remove));
			await tester.pump();

			verify(() => mockCubit.decrement()).called(1);
		});
	});
}

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}
