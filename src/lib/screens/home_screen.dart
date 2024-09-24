
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/cubits/counter_state.dart';
import '../cubits/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							'Counter Value:',
						),
						BlocBuilder<CounterCubit, CounterState>(
							builder: (context, state) {
								final counterValue = state.counter;
								return Text(
									'$counterValue',
									style: Theme.of(context).textTheme.headlineMedium,
								);
							},
						),
					],
				),
			),
			floatingActionButton: Column(
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().increment(),
						tooltip: 'Increment',
						child: Icon(Icons.add),
					),
					SizedBox(height: 10),
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().decrement(),
						tooltip: 'Decrement',
						child: Icon(Icons.remove),
					),
				],
			),
		);
	}
}
