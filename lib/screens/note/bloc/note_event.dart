import 'package:onboarding/screens/home/models/notes_model.dart';

abstract class NoteDetailsEvents {
  const NoteDetailsEvents();
}

class TriggerNoteDetailsEvent extends NoteDetailsEvents{
  const TriggerNoteDetailsEvent(this.note):super();
  final Note note;
}