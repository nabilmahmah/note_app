import 'package:note_app/models/note_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> notes;
  NoteSuccess(this.notes);
}

class NoteError extends NoteState {
  final String errorMes;
  NoteError({required this.errorMes});
}
