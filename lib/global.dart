import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/routes/bloc_observer.dart';
import 'package:onboarding/common/services/storage_service.dart';

class Global {
  static late StrorageService strorageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer=AppBlocObserver();
    strorageService = await StrorageService().init();

  }
}
