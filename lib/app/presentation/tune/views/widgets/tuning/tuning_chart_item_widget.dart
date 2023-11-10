import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/data/models/note_model.dart';

class TuningChartItemWidget extends StatelessWidget {
  const TuningChartItemWidget({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.note,
    required this.containerList,
  });

  final int? selectedIndex;
  final int index;
  final NoteModel note;
  final List<Container> containerList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color:
                selectedIndex == index ? note.color : const Color(0xFFC2C2C2),
          ),
          child: containerList[index]),
    );
  }
}
