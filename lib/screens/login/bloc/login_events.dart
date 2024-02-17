abstract class LoginEvent {
  const LoginEvent();
}

class EmailEvent extends LoginEvent {
  final String email;

  const EmailEvent({required this.email});
  
}

class PasswordEvent extends LoginEvent {
  final String password;

  const PasswordEvent({required this.password});
}
