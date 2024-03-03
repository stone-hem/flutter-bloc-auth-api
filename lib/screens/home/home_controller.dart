import 'package:flutter/material.dart';
import 'package:onboarding/global.dart';

class HomeController {
  final BuildContext context;
  
  var userProfile=Global.strorageService.getUserProfile();

  HomeController({required this.context});
  void init(){

  }
}