import 'package:flutter/material.dart';
import 'package:note_app/customs.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, required this.height, this.onPressed});

  final double height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        // iconColor: kprimaryColor,
        fixedSize: Size(MediaQuery.of(context).size.width, height * 0.05),
        backgroundColor: kprimaryColor,
      ),
      child: Text("Add", style: TextStyle(color: Colors.black, fontSize: 20)),
    );
  }
}
