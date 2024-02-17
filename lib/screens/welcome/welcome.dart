import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/global.dart';
import 'package:onboarding/screens/welcome/bloc/welcome_blocs.dart';
import 'package:onboarding/screens/welcome/bloc/welcome_events.dart';
import 'package:onboarding/screens/welcome/bloc/welcome_states.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
          return SafeArea(
            minimum:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "image",
                      "The time is now!",
                      "Lorem Ipsum text goes here to display more text. Lorem Ipsum text goes here to display more text",
                      "next",
                    ),
                    _page(
                      2,
                      context,
                      "image",
                      "Connect with Service Providers",
                      "Lorem Ipsum text goes here to display more text. Lorem Ipsum text goes here to display more text",
                      "next",
                    ),
                    _page(
                      3,
                      context,
                      "image",
                      "Seamless payments - Mpesa",
                      "Lorem Ipsum text goes here to display more text. Lorem Ipsum text goes here to display more text",
                      "Get Started",
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  child: DotsIndicator(
                    position: state.page,
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 3,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String image, String title,
      String desc, String buttonText) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Text(title),
        ),
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutBack);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('login', (route) => false);
              Global.strorageService
                  .setBool(AppConstants.appLaunchFirstTime, true);
            }
          },
          icon: const Icon(Icons.arrow_forward),
          label: Text(buttonText),
        )
      ],
    );
  }
}
