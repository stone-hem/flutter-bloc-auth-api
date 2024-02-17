import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/routes/names.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/login/bloc/login_blocs.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/screens/login/model/login_model.dart';

class LoginController {
  final BuildContext context;
  const LoginController({required this.context});

  Future<void> doLogin(String type) async {
    var getContext = Navigator.of(context);

    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          Fluttertoast.showToast(
            msg: "email cant be empty!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if (password.isEmpty) {
          Fluttertoast.showToast(
            msg: "password cant be empty!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        print(1);

        User user = User(email: state.email, password: state.password);

        var response = await http.post(
            Uri.parse("http://192.168.50.117:8000/api/login"),
            headers: {"content-type": "application/json"},
            body: jsonEncode(user));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          Global.strorageService
              .setInt(AppConstants.userId, data['user']['id']);
          Global.strorageService
              .setString(AppConstants.userTokenKey, data['token']);
          getContext.pushNamedAndRemoveUntil(RouteNames.app, (route) => false);
        }
      } else {
        print('other');
      }
    } catch (e) {
      rethrow;
    }
  }
}
