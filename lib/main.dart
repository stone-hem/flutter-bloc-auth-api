import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/routes/routes.dart';
import 'package:onboarding/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppPages.generateRouteSettings,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(103, 58, 183, 1),
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
