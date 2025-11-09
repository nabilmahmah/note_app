import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetchNotes/Note_cubit.dart';
import 'package:note_app/views/editeNoteView.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/utils/responsive.dart';

class Notecontainer extends StatelessWidget {
  const Notecontainer({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final bg = Color(note.color);
    final textColor = bg.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Editenoteview(note: note)),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          top: Responsive.hp(context, 2.5),
          bottom: Responsive.hp(context, 2.5),
          left: Responsive.wp(context, 4),
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(Responsive.wp(context, 3)),
        ),
        child: Column(
          children: [
            ListTile(
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                  Icons.delete,
                  color: textColor,
                  size: Responsive.sp(context, 5),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: Responsive.hp(context, 1)),
                child: Text(
                  note.title,
                  style: TextStyle(
                    fontSize: Responsive.sp(context, 4.5),
                    color: textColor,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: Responsive.hp(context, 1)),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: Responsive.sp(context, 3.2),
                    color: textColor.withOpacity(0.85),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: Responsive.wp(context, 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    note.date,
                    style: TextStyle(
                      fontSize: Responsive.sp(context, 3.2),
                      color: textColor.withOpacity(0.8),
                    ),
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
