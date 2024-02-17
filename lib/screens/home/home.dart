import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_states.dart';
import 'package:onboarding/screens/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "", drawerFunction: () {}, profileFunction: () {}),
      body: BlocBuilder<HomeBlocs, HomeStates>(builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, \nJohn Doe.",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const TextField(
                decoration: InputDecoration(hintText: "search"),
              ),
              const SizedBox(
                height: 20,
              ),
              sliderView(context, state),
              Text('Choose your option',style: Theme.of(context).textTheme.titleMedium,),
              Row(
                children: [
                  Chip(
                    label: const Text(
                      "categories",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    side: BorderSide.none,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Chip(
                    label: Text("popular"),
                    side: BorderSide.none,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Chip(
                    label: Text("another"),
                    side: BorderSide.none,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: const Icon(Icons.leaderboard),
                    title: Text("item $index"),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
