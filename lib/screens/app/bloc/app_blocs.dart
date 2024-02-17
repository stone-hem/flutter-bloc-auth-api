import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/app/bloc/app_events.dart';
import 'package:onboarding/screens/app/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerBottomBarEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
