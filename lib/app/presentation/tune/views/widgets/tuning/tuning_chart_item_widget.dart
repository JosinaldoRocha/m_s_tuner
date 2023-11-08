import 'package:flutter/material.dart';
//import 'package:m_s_afinador/app/data/models/note_model.dart';

class TuningChartItemWidget extends StatelessWidget {
  const TuningChartItemWidget({
    super.key,
    this.height,
    // required this.note,
  });
  final double? height;
  //final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Container(
          height: height ?? 56,
          width: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFC2C2C2),
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        //const SizedBox(width: 8),
      ],
    );
  }
}
