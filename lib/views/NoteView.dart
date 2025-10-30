import 'package:flutter/material.dart';
import 'package:note_app/widgets/NoteContainer.dart';

class Noteview extends StatelessWidget {
  const Noteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Notecontainer(),
        ),
      ),
    );
  }
}
