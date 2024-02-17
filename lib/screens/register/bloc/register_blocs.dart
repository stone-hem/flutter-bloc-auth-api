import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/register/bloc/register_events.dart';
import 'package:onboarding/screens/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent,RegisterStates>{
  void _usernameEvent(UsernameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(username: event.username));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePassEvent(RePassEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(rePass: event.rePass));
  }

  RegisterBlocs() : super(const RegisterStates()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePassEvent>(_rePassEvent);
  }


}