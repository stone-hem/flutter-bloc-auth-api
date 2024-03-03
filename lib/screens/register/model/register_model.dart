class User {
  final String? username;
  final String? email;
  final String? password;
  final String? passwordConfirmation;

  User({this.username, this.email, this.password,this.passwordConfirmation});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      passwordConfirmation: json['passwordConfirmation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (username != null) data['name'] = username;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (passwordConfirmation != null) data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
