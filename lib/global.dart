import 'package:flutter/cupertino.dart';
import 'package:onboarding/common/services/storage_service.dart';

class Global {
  static late StrorageService strorageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    strorageService = await StrorageService().init();
  }
}
