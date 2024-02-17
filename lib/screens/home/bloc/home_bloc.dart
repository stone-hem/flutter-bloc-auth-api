import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/home/bloc/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(const HomeStates()) {
    void _homeSliderEvent(HomeSliderEvent event, Emitter<HomeStates> emit) {
      emit(state.copyWith(index: event.index));
    }

    on<HomeSliderEvent>(_homeSliderEvent);
  }
}
