import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/fetchNotes/Note_states.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial()) {
    // load notes on creation
    fetchAllNotes();
  }

  List<NoteModel> notes = [];

  void fetchAllNotes() {
    try {
      var box = Hive.box<NoteModel>(kNoteBox);
      notes = box.values.toList();
      log('Hive box values: ${box.values.toList()}');
      emit(NoteSuccess(notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
