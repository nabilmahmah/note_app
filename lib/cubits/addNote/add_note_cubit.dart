import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/addNote/add_note_state.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color selectedColor = Colors.yellow;
  addNote(NoteModel note) async {
    // store the ARGB int value of the selected Color
    note.color = selectedColor.value;
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>(kNoteBox);
      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(errorMes: e.toString()));
    }
  }
}
