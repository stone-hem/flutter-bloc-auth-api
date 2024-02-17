import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/register/bloc/register_blocs.dart';
import 'package:onboarding/screens/welcome/bloc/welcome_blocs.dart';
import 'package:onboarding/screens/login/bloc/login_blocs.dart';


class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context)=>RegisterBlocs()),
  ];
}