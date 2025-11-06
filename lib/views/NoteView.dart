import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/cubits/addNote/add_note_state.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/widgets/NoteContainer.dart';
import 'package:note_app/widgets/addNewNote.dart';

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
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: kprimaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocConsumer<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
                  if (state is AddNoteError) {
                    debugPrint(state.errorMes);
                  }
                  if (state is AddNoteSuccess) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is AddNoteLoading ? true : false,
                    child: addNewNote(),
                  );
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
