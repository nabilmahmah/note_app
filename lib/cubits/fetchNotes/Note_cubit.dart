import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/fetchNotes/Note_states.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  fetchAllNotes() {
    try {
      var box = Hive.box<NoteModel>(kNoteBox);
      emit(NoteSuccess(box.values.toList()));
    } catch (e) {
      emit(NoteError(errorMes: e.toString()));
    }
  }
}
