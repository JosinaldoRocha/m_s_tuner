import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/tuning/tuning_chart_item_widget.dart';
import '../../../../../data/models/note_model.dart';

class TuningChartWidget extends StatefulWidget {
  const TuningChartWidget({
    super.key,
    required this.note,
    required this.frequency,
    required this.tuningType,
  });
  final TuningTypesModel tuningType;
  final NoteModel note;
  final double? frequency;

  @override
  State<TuningChartWidget> createState() => _TuningChartWidgetState();
}

class _TuningChartWidgetState extends State<TuningChartWidget> {
  PageController pageController = PageController(
    viewportFraction: 0.05,
    initialPage: 9,
  );
  int? selectedIndex;

  void updateSelectedIndex() {
    final note = widget.note;
    final frequency = widget.frequency;

    if (widget.frequency != null) {
      switch (note.noteTuning(frequency!)) {
        case 'Low':
          if (frequency < note.standardFrequency &&
              frequency >= note.minimumFrequency) {
            selectedIndex = 8;
          }
          if (frequency < note.minimumFrequency) {
            selectedIndex = 7;
          }
          break;
        case 'High':
          if (frequency > note.standardFrequency &&
              frequency <= note.maximumFrequency) {
            selectedIndex = 10;
          }
          if (frequency > note.maximumFrequency) {
            selectedIndex = 11;
          }
        default:
          selectedIndex = 9;
      }
    }
  }

  final barsList = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    updateSelectedIndex();

    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TuningChartItemWidget(
            selectedIndex: selectedIndex,
            index: index,
            note: widget.note,
            barsList: barsList,
          );
        },
        itemCount: barsList.length,
      ),
    );
  }
}
