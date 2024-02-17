import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/routes/names.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/app/app_page.dart';
import 'package:onboarding/screens/app/bloc/app_blocs.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/home.dart';
import 'package:onboarding/screens/login/bloc/login_blocs.dart';
import 'package:onboarding/screens/login/login.dart';
import 'package:onboarding/screens/profile/settings/bloc/settings_blocs.dart';
import 'package:onboarding/screens/profile/settings/settings.dart';
import 'package:onboarding/screens/register/bloc/register_blocs.dart';
import 'package:onboarding/screens/register/register.dart';
import 'package:onboarding/screens/welcome/bloc/welcome_blocs.dart';
import 'package:onboarding/screens/welcome/welcome.dart';

//unify bloc provider with routes plus pages
class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: RouteNames.initial,
        page: const WelcomeScreen(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: RouteNames.register,
        page: const RegisterScreen(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: RouteNames.login,
        page: const LoginScreen(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      PageEntity(
        route: RouteNames.app,
        page: const AppPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
      PageEntity(
        route: RouteNames.home,
        page: const HomeScreen(),
        bloc: BlocProvider(
          create: (_) => HomeBlocs(),
        ),
      ),
      PageEntity(
        route: RouteNames.settings,
        page: const SettingScreen(),
        bloc: BlocProvider(
          create: (_) => SettingsBlocs(),
        ),
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire screen as we click on navigator object

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name match when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        //get value from shared prefs data about app first launch status
        bool isAppFirstLaunch = Global.strorageService.getLaunchStatus();
        /*
        if its the first time and route name is the initial then 
        also check if the user is logged in ? redirect to home page:
        redirect to login page
        */
        if (result.first.route == RouteNames.initial && isAppFirstLaunch) {
          bool isLoggedIn = Global.strorageService.getIsLoginStatus();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const AppPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const LoginScreen(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
      builder: (_) => const LoginScreen(),
      settings: settings,
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
