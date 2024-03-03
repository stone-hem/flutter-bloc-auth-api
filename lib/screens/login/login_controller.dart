import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/routes/names.dart';
import 'package:onboarding/common/widgets/pop_up_toast.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/login/bloc/login_blocs.dart';
import 'package:onboarding/screens/login/model/login_model.dart';

class LoginController {
  final BuildContext context;

  const LoginController({required this.context});

  Future<void> doLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          showMotionToastError(
              context: context,
              subject: "Missing Information!",
              title: 'Error');
        }
        if (password.isEmpty) {
          showMotionToastError(
              context: context,
              subject: "Missing Information!",
              title: 'Error');
        }

        User user = User(email: state.email, password: state.password);

        var response = await http.post(
            Uri.parse("${AppConstants.baseUrl}/login"),
            headers: {"content-type": "application/json"},
            body: jsonEncode(user));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          Global.strorageService
              .setString(AppConstants.userProfileKey, jsonEncode(data['user']));
          Global.strorageService
              .setString(AppConstants.userTokenKey, data['token']);
          if (context.mounted) {
            showMotionToastSuccess(
                context: context,
                subject: "login succesfull!",
                title: 'success');
            Navigator.of(context)
                .pushNamedAndRemoveUntil(RouteNames.app, (route) => false);
          }
        } else {
          if (context.mounted) {
            showMotionToastError(
                context: context,
                subject: "${response.reasonPhrase}",
                title: 'Error');
          }
        }
      } else {
        showMotionToastError(
            context: context, subject: "Unexpected Error!", title: 'Error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
