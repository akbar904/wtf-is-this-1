class CounterState {
  final int counter;

  CounterState({this.counter = 0});

  Map<String, dynamic> toJson() {
    return {'counter': counter};
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: json['counter'] ?? 0,
    );
  }
}
