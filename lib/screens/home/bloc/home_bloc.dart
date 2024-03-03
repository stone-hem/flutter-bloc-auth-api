import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/home/bloc/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(const HomeStates()) {
    on<HomeSliderEvent>(_homeSliderEvent);
    on<HomeNotesEvent>(_homeNotesEvent);
  }
  void _homeSliderEvent(HomeSliderEvent event, Emitter<HomeStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homeNotesEvent(HomeNotesEvent event, Emitter<HomeStates> emit) {
    emit(state.copyWith(noteItem: event.noteItem));
  }
}
