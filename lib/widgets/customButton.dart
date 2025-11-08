import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/cubits/addNote/add_note_state.dart';
import 'package:note_app/customs.dart';
import 'package:note_app/widgets/addNewNote.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.onPressed,
  });

  final double height;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, height * 0.05),
            backgroundColor: kprimaryColor,
          ),
          child: state is AddNoteLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.black),
                )
              : Text(
                  "Add",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
        );
      },
    );
  }
}
