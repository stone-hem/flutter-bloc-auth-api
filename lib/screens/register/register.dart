import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/routes/names.dart';
import 'package:onboarding/screens/register/bloc/register_blocs.dart';
import 'package:onboarding/screens/register/bloc/register_events.dart';
import 'package:onboarding/screens/register/bloc/register_states.dart';
import 'package:onboarding/screens/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Register",
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  context.read<RegisterBlocs>().add(UsernameEvent(value));
                },
                style: const TextStyle(color: Colors.black),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'username',
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
                  context.read<RegisterBlocs>().add(EmailEvent(value));
                },
                style: const TextStyle(color: Colors.black),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: TextInputType.emailAddress,
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
                  context.read<RegisterBlocs>().add(PasswordEvent(value));
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
              TextField(
                onChanged: (value) {
                  context.read<RegisterBlocs>().add(RePassEvent(value));
                },
                style: const TextStyle(color: Colors.black),
                cursorColor: const Color(0xFF9b9b9b),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Repeat password',
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
                  RegisterController(context: context).doRegister();
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
                  label: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(RouteNames.login),
                child: const Text("Have an Account? Click to Login"),
              )
            ],
          ),
        )),
      );
    });
  }
}
