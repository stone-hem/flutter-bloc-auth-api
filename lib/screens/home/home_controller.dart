import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/utils/http_util.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/home/models/notes_model.dart';

class HomeController {
  late BuildContext context;

  get userProfile => Global.strorageService.getUserProfile();
  //creating a singleton constructor
  static final HomeController _singelton= HomeController._internal();
  HomeController._internal();
  //factory constructor makes sure you only have one instance
  factory HomeController({required BuildContext context}){
    _singelton.context=context;
    return _singelton;
  }
  Future<void> init() async {
    if (Global.strorageService.getUserToken().isNotEmpty) {
      HttpUtil.get('${AppConstants.baseUrl}/notes').then((data) {
        final List<Note> notes =
            data.map((json) => Note.fromJson(json)).toList();
        context.read<HomeBlocs>().add(HomeNotesEvent(notes));
      });
    }
  }
}
