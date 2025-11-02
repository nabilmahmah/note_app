import 'package:flutter/material.dart';
import 'package:note_app/customs.dart';

class Customtexefield extends StatelessWidget {
  const Customtexefield({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.onSaved,
  });
  final int maxLines;
  final String title;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "this field is required";
          }
          return null;
        },
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: outLineBorder(),
          focusedBorder: outLineBorder(),
          enabledBorder: outLineBorder(),
          hintText: title,
        ),
      ),
    );
  }
}

OutlineInputBorder outLineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: kprimaryColor, width: 2),
  );
}
