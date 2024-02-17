import 'package:flutter/cupertino.dart';
import 'package:onboarding/screens/home/home.dart';
import 'package:onboarding/screens/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomeScreen(),
    const Center(
      child: Text("History"),
    ),
    const ProfileScreen()
  ];
  return widget[index];
}
