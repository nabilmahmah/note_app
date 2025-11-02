import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/addNote/note_state.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  addNote(NoteModel note) async {
    emit(NoteLoading());
    try {
      var box = Hive.box<NoteModel>(kNoteBox);
      await box.add(note);
      emit(Noteloaded());
    } catch (e) {
      emit(NoteError(errorMes: e.toString()));
    }
  }
}
