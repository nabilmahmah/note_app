import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/customButton.dart';
import 'package:note_app/widgets/customTexeField.dart';

class addNewNote extends StatelessWidget {
  const addNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    String? title, description;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            Customtexefield(
              title: "Title",
              onSaved: (value) {
                title = value;
              },
            ),
            Customtexefield(
              title: "Description",
              maxLines: 5,
              onSaved: (value) {
                description = value;
              },
            ),
            SizedBox(height: height * 0.15),

            customButton(
              height: height,
              onPressed: () {
                if (formkey.currentState?.validate() ?? false) {
                  formkey.currentState!.save();
                  var note = NoteModel(
                    title: title!,
                    subtitle: description!,
                    date: DateTime.now().toString(),
                    color: Colors.yellow.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(note);
                }
              },
            ),

            SizedBox(height: height * 0.2),
          ],
        ),
      ),
    );
  }
}
