abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class Noteloaded extends NoteState {}

class NoteError extends NoteState {
  final String errorMes;
  NoteError({required this.errorMes});
}
