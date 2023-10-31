import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';
import 'package:m_s_afinador/app/presentation/tune/views/mixins/tuning_mixin.dart';
import '../../providers/tune_provider.dart';

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
    final tuningList = widget.tuningType.tuning;
    final tuningType = widget.tuningType;
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
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Text(
                  tuningList[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: selectedIndex == index ? 0.9 : null,
                    color: selectedIndex == index
                        ? tuningList[selectedIndex!].color
                        : const Color(0xFFC2C2C2),
                    fontSize: selectedIndex == index ? 56 : 32,
                  ),
                );
              },
              itemCount: tuningList.length,
            ),
          ),
          const SizedBox(height: 12),
          selectedIndex != null
              ? Text(
                  '${tuningList[selectedIndex!].noteTuning(frequency)} '
                  '(${tuningType.getNote(frequency!)})',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: tuningList[selectedIndex!].color,
                    fontSize: 20,
                    height: 0,
                  ),
                )
              : const SizedBox(height: 25),
          const SizedBox(height: 6),
          Text(
            frequency != null && frequency != 0
                ? '${frequency!.toStringAsFixed(2)} Hz'
                : 'Toque uma corda',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFFC2C2C2), height: 0),
          ),
        ],
      ),
    );
  }
}
