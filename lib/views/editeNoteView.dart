import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetchNotes/Note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/customTexeField.dart';

class Editenoteview extends StatelessWidget {
  Editenoteview({super.key, required this.note});
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    String? title, description;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          IconButton(
            onPressed: () {
              note.title = title ?? note.title;
              note.subtitle = description ?? note.subtitle;
              note.save();
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Customtexefield(
            title: "Tite",
            onChanged: (value) {
              title = value;
            },
            initialValue: note.title,
          ),
          Customtexefield(
            title: "Description",
            onChanged: (value) {
              description = value;
            },
            maxLines: 8,
            initialValue: note.subtitle,
          ),
        ],
      ),
    );
  }
}
