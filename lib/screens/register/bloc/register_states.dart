class RegisterStates {
  final String username;
  final String email;
  final String password;
  final String rePass;

  const RegisterStates(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.rePass = ""});

  RegisterStates copyWith({
    String? username,
    String? email,
    String? password,
    String? rePass,
  }) {
    return RegisterStates(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      rePass: rePass ?? this.rePass,
    );
  }
}
