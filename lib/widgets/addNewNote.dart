import 'package:flutter/material.dart';
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
                  Navigator.of(context).pop();
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
