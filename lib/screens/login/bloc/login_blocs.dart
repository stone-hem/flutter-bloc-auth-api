import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/login/bloc/login_events.dart';
import 'package:onboarding/screens/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }
  
  LoginBloc() : super(const LoginState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
}
