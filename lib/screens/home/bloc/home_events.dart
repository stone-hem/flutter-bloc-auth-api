import 'package:onboarding/screens/home/models/notes_model.dart';

abstract class HomeEvents {
  const HomeEvents();
}

class HomeSliderEvent extends HomeEvents {
  final int index;

  const HomeSliderEvent(this.index);
}

class HomeNotesEvent extends HomeEvents {
  final List<Note> noteItem;
  const HomeNotesEvent(this.noteItem);
}
