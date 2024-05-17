import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(value: 0, hasIncremnted: false));

  void increment() {
    emit(CounterState(
      value: state.value + 1,
      hasIncremnted: true,
    ));
  }

  void decrement() {
    if (state.value > 0) {
      emit(CounterState(
        value: state.value > 0 ? state.value - 1 : 0,
        hasIncremnted: false,
      ));
    }
  }
}
