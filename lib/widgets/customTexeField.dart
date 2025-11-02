import 'package:flutter/material.dart';
import 'package:note_app/customs.dart';

Padding customTextField({required String title, int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),

    child: TextField(
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

OutlineInputBorder outLineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: kprimaryColor, width: 2),
  );
}
