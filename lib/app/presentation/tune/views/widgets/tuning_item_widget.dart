import 'package:flutter/material.dart';
import '../../../../data/models/note_model.dart';

class TuningItemWidget extends StatelessWidget {
  const TuningItemWidget({
    super.key,
    required this.note,
    required this.selectedIndex,
    required this.index,
  });

  final NoteModel note;
  final int index;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Text(
      note.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: selectedIndex == index ? 0.9 : null,
        color: selectedIndex == index ? note.color : const Color(0xFFC2C2C2),
        fontSize: selectedIndex == index ? 56 : 32,
      ),
    );
  }
}
