import 'package:flutter_16_bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final StreamController _numberController = StreamController<int>();
  // late StreamSink numberSink;
  // late Stream numberStream;
  // int number = 0;

  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<IncrementCounter>((event, emit) {
      // final newState = HomeState();
      // newState.counter = state.counter + 1;
      // newState.number = state.number;
      final newState = state.copyWith(counter: state.counter + 1);

      emit(newState);
    });
    on<DecrementCounter>((event, emit) {
      final newState = HomeState();
      newState.counter = state.counter - 1;
      emit(newState);
    });
    on<IncrementNumber>((event, emit) {
      // final newState = HomeState();
      // newState.number = state.number + 1;
      // newState.counter = state.counter;

      final newState = state.copyWith(number: state.number + 1);

      emit(newState);
    });
    on<DecrementNumber>((event, emit) {
      final newState = HomeState();
      newState.number = state.number - 1;
      emit(newState);
    });

    // on<HomeEvent>((event, emit) {
    //   if (event is Increment) {
    //     var newState = HomeState();
    //     newState.counter = state.counter + 1;
    //     newState.number = state.number + 2;
    //
    //     emit(newState);
    //
    //     // final newState = state. + 4;
    //     // emit(newState);
    //   } else if (event is Decrement) {
    //     // var newState = state - 2;
    //     // if (newState < 0) {
    //     //   newState = 0;
    //     // }
    //     // notify to UI
    //     // emit(newState);
    //   } else {}
    // });
  }
}
