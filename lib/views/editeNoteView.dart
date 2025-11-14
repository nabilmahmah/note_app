import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/cubits/fetchNotes/Note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_listview.dart';
import 'package:note_app/widgets/customTexeField.dart';

class Editenoteview extends StatefulWidget {
  const Editenoteview({super.key, required this.note});

  final NoteModel note;

  @override
  State<Editenoteview> createState() => _EditenoteviewState();
}

class _EditenoteviewState extends State<Editenoteview> {
  String? title;
  String? description;

  @override
  void initState() {
    super.initState();
    title = widget.note.title;
    description = widget.note.subtitle;
    // initialize the cubit's selected color to the note's color so UI shows current selection
    try {
      context.read<AddNoteCubit>().selectedColor = Color(widget.note.color);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = description ?? widget.note.subtitle;
              // store selectedColor's int value
              try {
                widget.note.color = context
                    .read<AddNoteCubit>()
                    .selectedColor
                    .value;
              } catch (_) {}
              widget.note.save();
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        children: [
          Customtexefield(
            title: "Tite",
            onChanged: (value) {
              title = value;
            },
            initialValue: widget.note.title,
          ),
          Customtexefield(
            title: "Description",
            onChanged: (value) {
              description = value;
            },
            maxLines: 8,
            initialValue: widget.note.subtitle,
          ),
          const ColorListview(),
        ],
      ),
    );
  }
}
