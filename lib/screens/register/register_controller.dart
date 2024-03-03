import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/widgets/pop_up_toast.dart';
import 'package:onboarding/screens/register/bloc/register_blocs.dart';
import 'package:onboarding/screens/register/model/register_model.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> doRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePass = state.rePass;

    if (username.isEmpty) {}
    if (email.isEmpty) {}
    if (password.isEmpty) {}
    if (rePass.isEmpty) {}
    if (password != rePass) {}

    try {
      User user = User(
        email: state.email,
        password: state.password,
        username: state.username,
        passwordConfirmation: rePass,
      );

      var response = await http.post(
          Uri.parse("${AppConstants.baseUrl}/register"),
          headers: {"content-type": "application/json"},
          body: jsonEncode(user));
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
      } else {
        showMotionToastError(context: context, subject: "Unexpected Error!", title: 'Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
