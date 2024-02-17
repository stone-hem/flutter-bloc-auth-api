import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  void doRegister() {
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

    try{
      //send api call here ... if success then pop
      if(email=="hem@gmail.com"){
        Navigator.of(context).pop();
      }
    }catch(e){
      print(e);
    }

  }
}
