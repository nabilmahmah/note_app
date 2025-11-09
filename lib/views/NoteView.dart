import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_floting_action_button.dart';
import 'package:note_app/widgets/note_listview.dart';

class Noteview extends StatelessWidget {
  const Noteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Notes"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: NoteListView(),
      floatingActionButton: CustomFlotingActionButton(),
    );
  }
}
