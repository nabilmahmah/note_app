import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetchNotes/Note_cubit.dart';
import 'package:note_app/cubits/fetchNotes/Note_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/NoteContainer.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        final items = state is NoteSuccess ? state.notes : <NoteModel>[];
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final note = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Notecontainer(note: note),
            );
          },
        );
      },
    );
  }
}
