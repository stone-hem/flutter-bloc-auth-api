import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/widgets/bottom_bar_widgets.dart';
import 'package:onboarding/screens/app/bloc/app_blocs.dart';
import 'package:onboarding/screens/app/bloc/app_events.dart';
import 'package:onboarding/screens/app/bloc/app_states.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
      return Scaffold(
        body: buildPage(state.index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.index,
          onTap: (value) {
            context.read<AppBlocs>().add(TriggerBottomBarEvent(value));
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.history),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            )
          ],
        ),
      );
    });
  }
}
