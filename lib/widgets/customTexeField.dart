import 'package:flutter/material.dart';
import 'package:note_app/customs.dart';

class Customtexefield extends StatelessWidget {
  const Customtexefield({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.onChanged,
    this.initialValue,
  });
  final String? initialValue;
  final int maxLines;
  final String title;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "this field is required";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
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
