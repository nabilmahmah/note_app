import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/cubits/addNote/add_note_state.dart';
import 'package:note_app/cubits/fetchNotes/Note_cubit.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/widgets/addNewNote.dart';

class CustomFlotingActionButton extends StatelessWidget {
  const CustomFlotingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.black,
      backgroundColor: kprimaryColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          // isScrollControlled: true,
          builder: (context) {
            // Use Padding with viewInsets so the modal rises above the keyboard
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BlocListener<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
                  if (state is AddNoteSuccess) {
                    context.read<NoteCubit>().fetchAllNotes();

                    Navigator.pop(context);
                  }
                  if (state is AddNoteError) {
                    debugPrint(state.errorMes);
                  }
                },
                child: AddNewNote(),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
