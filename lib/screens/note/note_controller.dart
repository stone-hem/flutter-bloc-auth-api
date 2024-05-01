import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/common/constants/constants.dart';
import 'package:onboarding/common/utils/http_util.dart';
import 'package:onboarding/screens/home/models/notes_model.dart';
import 'package:onboarding/screens/note/bloc/note_blocs.dart';
import 'package:onboarding/screens/note/bloc/note_event.dart';

class NoteController {
  final BuildContext context;

  NoteController({required this.context});

  Future<void> init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    HttpUtil.getSingle('${AppConstants.baseUrl}/notes/${args['id']}')
        .then((data) {
      Note note = Note(
        id: data['id'],
        title: data['title'],
        content: data['content'],
        createdAt: DateTime.parse(data['created_at']),
        updatedAt: DateTime.parse(data['updated_at']),
      );
      context.read<NoteBloc>().add(TriggerNoteDetailsEvent(note));
    });
  }
}
