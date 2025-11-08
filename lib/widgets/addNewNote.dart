import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/customButton.dart';
import 'package:note_app/widgets/customTexeField.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    String? title, description;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.035,
        vertical: height * 0.05,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              // SizedBox(height: height * 0.05),
              Customtexefield(
                title: "Title",
                onChanged: (value) {
                  title = value;
                },
              ),
              Customtexefield(
                title: "Description",
                maxLines: 5,
                onChanged: (value) {
                  description = value;
                },
              ),
              SizedBox(height: height * 0.15),

              CustomButton(
                height: height,
                onPressed: () {
                  addNote(formkey, title, description, context);
                },
              ),

              SizedBox(height: height * 0.2),
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
      var note = NoteModel(
        title: title!,
        subtitle: description!,
        date: DateTime.now().toString(),
        color: Colors.yellow.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    }
  }
}
