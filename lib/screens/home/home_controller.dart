import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/utils/http_util.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/home/models/notes_model.dart';

class HomeController {
  final BuildContext context;

  var userProfile = Global.strorageService.getUserProfile();

  HomeController({required this.context});
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
