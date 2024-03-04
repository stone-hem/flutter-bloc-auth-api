import 'package:onboarding/screens/home/models/notes_model.dart';

class NoteDetailsStates {
  const NoteDetailsStates({this.note});
  final Note? note;

  NoteDetailsStates copyWith({Note? note}){
    return NoteDetailsStates(note:note??this.note);
  }
}