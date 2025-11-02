import 'package:flutter/material.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/widgets/customTexeField.dart';

class addNewNote extends StatelessWidget {
  const addNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        customTextField(title: "Title"),
        customTextField(title: "Description", maxLines: 5),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),

        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kprimaryColor),
            fixedSize: WidgetStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          child: Text(
            "Add",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
