import 'package:flutter/material.dart';
import 'package:note_app/views/editeNoteView.dart';
import 'package:note_app/models/note_model.dart';

class Notecontainer extends StatelessWidget {
  const Notecontainer({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Editenoteview()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 205, 121),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.black, size: 40),
              ),
              title: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Text(
                  note.title,
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Text(
                  note.subtitle,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    note.date,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
