import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/addNote/add_note_cubit.dart';
import 'package:note_app/widgets/color_item.dart';

class ColorListview extends StatefulWidget {
  const ColorListview({super.key});

  @override
  State<ColorListview> createState() => _ColorListviewState();
}

class _ColorListviewState extends State<ColorListview> {
  int selectedIndex = 0;
  List<Color> colors = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    // initialize selectedIndex from cubit's selected color if available
    try {
      final sel = context.read<AddNoteCubit>().selectedColor;
      final idx = colors.indexWhere((c) => c.value == sel.value);
      if (idx >= 0) selectedIndex = idx;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  context.read<AddNoteCubit>().selectedColor = colors[index];
                  selectedIndex = index;
                });
              },
              child: ColorItem(
                color: colors[index],
                isSelected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
