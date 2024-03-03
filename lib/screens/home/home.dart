import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_bloc.dart';
import 'package:onboarding/screens/home/bloc/home_states.dart';
import 'package:onboarding/screens/home/home_controller.dart';
import 'package:onboarding/screens/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController=HomeController(context: context);
    _homeController.init();
  }
  @override
  Widget build(BuildContext context) {
    return _homeController.userProfile==null?Container():Scaffold(
      appBar: appBar(title: "", drawerFunction: () {}, profileFunction: () {}),
      body: BlocBuilder<HomeBlocs, HomeStates>(builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, \n${_homeController.userProfile['name']}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search ...",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.0,color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(20))),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.0,color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.0,color: Colors.transparent),borderRadius: BorderRadius.all(Radius.circular(20)))
                  ),
                ),
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
