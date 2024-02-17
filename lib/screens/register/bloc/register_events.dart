abstract class RegisterEvent{
  const RegisterEvent();
}

class UsernameEvent extends RegisterEvent{
  final String username;
  const UsernameEvent(this.username);
}

class EmailEvent extends RegisterEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent{
  final String password;
  const PasswordEvent(this.password);
}

class RePassEvent extends RegisterEvent{
  final String rePass;
  const RePassEvent(this.rePass);
}