import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';
import 'package:m_s_afinador/app/data/utils/note_utils.dart';
import 'package:m_s_afinador/app/presentation/tune/views/mixins/tuning_mixin.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/tuning/tuning_chart_widget.dart';
import '../../providers/tune_provider.dart';
import 'tuning/tuning_item_widget.dart';

class TuningWidget extends ConsumerStatefulWidget {
  const TuningWidget({
    super.key,
    required this.tuningType,
  });
  final TuningTypesModel tuningType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuningWidgetState();
}

class _TuningWidgetState extends ConsumerState<TuningWidget> with TuningMixin {
  @override
  void initState() {
    super.initState();
    initialPage = (widget.tuningType.tuning.length ~/ 2) - 1;
    pageController = PageController(
      viewportFraction: 0.10,
      initialPage: initialPage!,
    );
    Future.microtask(
        () => ref.read(microphoneProvider.notifier).loadPermission());
  }

  @override
  void dispose() {
    if (flutterFft.getIsRecording) {
      flutterFft.stopRecorder();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteList = widget.tuningType.tuning;
    microphoneListen();
    updateSelectedIndex();

    return Padding(
      padding: const EdgeInsets.only(
        top: 72,
        bottom: 12,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TuningItemWidget(
                  note: noteList[index],
                  selectedIndex: selectedIndex,
                  index: index,
                );
              },
              itemCount: noteList.length,
            ),
          ),
          _buildFrequencyStatus(),
          if (selectedIndex != null)
            TuningChartWidget(
              tuningType: widget.tuningType,
              note: noteList[selectedIndex!],
              frequency: frequency,
            ),
        ],
      ),
    );
  }

  Column _buildFrequencyStatus() {
    final noteList = widget.tuningType.tuning;
    final note = NoteUtils.getNote(frequency);
    return Column(
      children: [
        const SizedBox(height: 12),
        selectedIndex != null
            ? Text(
                '${noteList[selectedIndex!].noteTuning(frequency)} '
                '(${note.title})',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: noteList[selectedIndex!].color,
                  fontSize: 20,
                  height: 0,
                ),
              )
            : const SizedBox(height: 25),
        const SizedBox(height: 6),
        Text(
          frequency != null
              ? '${frequency!.toStringAsFixed(2)} Hz'
              : 'Toque uma corda',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFC2C2C2),
            height: 0,
          ),
        ),
        const SizedBox(height: 19),
      ],
    );
  }
}
