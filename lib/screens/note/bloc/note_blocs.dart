import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/screens/note/bloc/note_event.dart';
import 'package:onboarding/screens/note/bloc/note_states.dart';

class NoteBloc extends Bloc<NoteDetailsEvents,NoteDetailsStates> {
  NoteBloc():super(const NoteDetailsStates()){
    on<TriggerNoteDetailsEvent>(_triggerNoteDetailsEvent);
  }
  void _triggerNoteDetailsEvent(TriggerNoteDetailsEvent event,Emitter<NoteDetailsStates> emit){
    emit(state.copyWith(note: event.note));
  }
}