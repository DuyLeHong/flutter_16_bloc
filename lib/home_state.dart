class HomeState {
  int number = 0;
  int counter = 0;

  HomeState();

  //{}: named constructor/function
  // []: Optional constructor/function

  HomeState copyWith({
    int? number = null,
    int? counter = null,
  }) {
    final newValue = HomeState();
    newValue.counter = counter ?? this.counter;
    newValue.number = number ?? this.number;

    return newValue;
  }
}
