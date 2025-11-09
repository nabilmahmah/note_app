import 'package:flutter/material.dart';
import 'package:note_app/widgets/NoteContainer.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Notecontainer(),
      ),
    );
  }
}
