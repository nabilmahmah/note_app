import 'package:flutter/material.dart';
import 'package:note_app/widgets/customTexeField.dart';

class Editenoteview extends StatelessWidget {
  const Editenoteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Column(
        children: [
          Customtexefield(title: "Tite"),
          Customtexefield(title: "Description", maxLines: 8),
        ],
      ),
    );
  }
}
