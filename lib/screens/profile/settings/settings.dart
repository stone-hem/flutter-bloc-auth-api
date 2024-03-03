import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/routes/routes.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/app/bloc/app_blocs.dart';
import 'package:onboarding/screens/app/bloc/app_events.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/profile/settings/bloc/settings_blocs.dart';
import 'package:onboarding/screens/profile/settings/bloc/settings_states.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _doLogout() {
    context.read<AppBlocs>().add(const TriggerBottomBarEvent(0));
    context.read<HomeBlocs>().add(const HomeSliderEvent(0));
    Global.strorageService.remove(AppConstants.userTokenKey);
    Global.strorageService.remove(AppConstants.userProfileKey);
    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body:
          BlocBuilder<SettingsBlocs, SettingStates>(builder: (context, state) {
        return SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: const Text("Logout?"),
                            content: const Text("Are you sure?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel')),
                              TextButton(
                                  onPressed: () => _doLogout(),
                                  child: const Text('Logout'))
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100)),
                  child: const Text('Logout'))
            ],
          ),
        ));
      }),
    );
  }
}
