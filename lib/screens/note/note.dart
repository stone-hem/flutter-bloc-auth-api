import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late var id;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     id=ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: Card.outlined(
        margin: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.maxFinite,
          child: Column(
            children: [
              Text('${id.values}',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
