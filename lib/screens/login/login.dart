import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/routes/routes.dart';
import 'package:onboarding/screens/login/bloc/login_blocs.dart';
import 'package:onboarding/screens/login/bloc/login_events.dart';
import 'package:onboarding/screens/login/bloc/login_states.dart';
import 'package:onboarding/screens/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  context.read<LoginBloc>().add(EmailEvent(email: value));
                },
                style: const TextStyle(color: Colors.black),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'email',
                  hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextField(
                onChanged: (value) {
                  context.read<LoginBloc>().add(PasswordEvent(password: value));
                },
                style: const TextStyle(color: Colors.black),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF363f93),
                  fixedSize: Size.fromWidth(width * 0.9),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  LoginController(context: context).doLogin('email');
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                label: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(RouteNames.register),
                child: const Text('No Account? Click to Register'),
              )
            ],
          ),
        )),
      );
    });
  }
}
