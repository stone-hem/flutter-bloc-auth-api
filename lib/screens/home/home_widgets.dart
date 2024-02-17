import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_events.dart';
import 'package:onboarding/screens/home/bloc/home_states.dart';

AppBar appBar(
    {required String title,
    required Function drawerFunction,
    required Function profileFunction}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.menu_book),
      onPressed: () => drawerFunction,
    ),
    title: Text(title),
    actions: [
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () => profileFunction,
      ),
    ],
  );
}

Widget sliderView(BuildContext context, HomeStates state) {
  return SizedBox(
    height: MediaQuery.of(context).size.width * 0.65,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.55,
          child: PageView(
              onPageChanged: (value) {
                context.read<HomeBlocs>().add(HomeSliderEvent(value));
              },
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/marek.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Art & Design",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Something very large description here to give detail explanation of the same",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Continue'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/marek.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Art & Design",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Something very large description here to give detail explanation of the same",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Continue'),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/marek.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Art & Design",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Title",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Something very large description here to give detail explanation of the same",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Continue'),
                      )
                    ],
                  ),
                ),
              ]),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              size: const Size.square(5.0),
              activeSize: const Size(18.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
        ),
      ],
    ),
  );
}
