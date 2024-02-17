import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/profile/settings/bloc/settings_events.dart';
import 'package:onboarding/screens/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingStates> {
  SettingsBlocs() : super(const SettingStates()) {
    on<SettingsScreenEvent>(_callSettingsEvent);
  }

  void _callSettingsEvent(SettingsEvents event, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
