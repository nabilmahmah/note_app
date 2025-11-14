import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_listview.dart';
import 'package:note_app/widgets/customButton.dart';
import 'package:note_app/widgets/customTexeField.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  String? title, description;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Customtexefield(
                title: "Title",
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: height * 0.015),
              Customtexefield(
                title: "Description",
                maxLines: 5,
                onChanged: (value) {
                  description = value;
                },
              ),
              SizedBox(height: height * 0.015),
              ColorListview(),
              // ColorItem(),
              SizedBox(height: height * 0.015),

              CustomButton(
                height: height,
                onPressed: () {
                  addNote(formkey, title, description, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNote(
    GlobalKey<FormState> formkey,
    String? title,
    String? description,
    BuildContext context,
  ) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var currentDate = DateTime.now();
      var formattedDate = DateFormat.yMMMMd().format(currentDate);
      var note = NoteModel(
        title: title!,
        subtitle: description!,
        date: formattedDate,
        color: Colors.yellow.toARGB32(),
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    }
  }
}
