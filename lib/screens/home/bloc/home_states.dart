import 'package:onboarding/screens/home/models/notes_model.dart';

class HomeStates {
  final int index;
  final List<Note> noteItem;

  const HomeStates({this.index = 0, this.noteItem = const <Note>[]});

  HomeStates copyWith({int? index, List<Note>? noteItem}) {
    return HomeStates(
        index: index ?? this.index, noteItem: noteItem ?? this.noteItem);
  }
}
