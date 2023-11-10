import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/data/models/note_model.dart';

class TuningChartItemWidget extends StatelessWidget {
  const TuningChartItemWidget({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.note,
    required this.barsList,
  });

  final int? selectedIndex;
  final int index;
  final NoteModel note;
  final List<Container> barsList;

  double get getHeight {
    if (selectedIndex == index) {
      return 114;
    } else if (index == 9) {
      return 180;
    } else if (index == 1 || index == 5 || index == 13 || index == 17) {
      return 86;
    } else {
      return 56;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 4,
          height: getHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color:
                selectedIndex == index ? note.color : const Color(0xFFC2C2C2),
          ),
          child: barsList[index]),
    );
  }
}
