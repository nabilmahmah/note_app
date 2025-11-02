import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/NoteView.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const note_app());
}

class note_app extends StatelessWidget {
  const note_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      home: Noteview(),
    );
  }
}
