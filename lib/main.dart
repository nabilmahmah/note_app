import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/cubits/addNote/add_note_state.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/models/simple_observer.dart';
import 'package:note_app/views/NoteView.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer = SimpleObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        home: Noteview(),
      ),
    );
  }
}
