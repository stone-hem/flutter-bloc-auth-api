import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/note/bloc/note_blocs.dart';
import 'package:onboarding/screens/note/bloc/note_states.dart';
import 'package:onboarding/screens/note/note_controller.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late NoteController _noteController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _noteController = NoteController(context: context);
    setState(() {
      _noteController.init();
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteDetailsStates>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
        ),
        body:state.note==null? RefreshIndicator.adaptive(child: const Icon(Icons.refresh), onRefresh: (){
          return Future(() => null);
        }) :Card.outlined(
          margin: const EdgeInsets.all(15.0),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.maxFinite,
            child: Column(
              children: [
                Text(
                  state.note==null?'loading':state.note!.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
