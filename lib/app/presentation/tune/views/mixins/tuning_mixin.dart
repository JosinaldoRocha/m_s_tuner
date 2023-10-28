import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/tuning_widget.dart';
import '../../providers/tune_provider.dart';
import '../../states/microphone_permission/microphone_permission_state.dart';

mixin TuningMixin on ConsumerState<TuningWidget> {
  PageController? pageController;
  int? selectedIndex;
  double? frequency;
  FlutterFft flutterFft = FlutterFft();
  int? initialPage;

  void microphoneListen() {
    ref.listen<MicrophonePermissionState>(
      microphoneProvider,
      (previous, next) {
        if (next is SuccessMicrophonePermissionState) {
          initialize();
        }
        if (next is FailureMicrophonePermissionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFFC2C2C2),
              content: Text(
                next.errorMessage,
                style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
              ),
            ),
          );
        }
      },
    );
  }

  void initialize() async {
    await flutterFft.startRecorder();
    flutterFft.onRecorderStateChanged.listen(
      (data) {
        if (mounted) {
          setState(() => frequency = data[1] as double);
          flutterFft.setFrequency = frequency!;
        }
      },
      onError: (err) {},
      onDone: () => {},
    );
  }

  @override
  void didUpdateWidget(TuningWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tuningType != oldWidget.tuningType) {
      initialPage = (widget.tuningType.tuning.length ~/ 2) - 1;
      pageController!.jumpToPage(initialPage!);
      selectedIndex = null;
      frequency = null;
    }
  }

  void updatePage() {
    if (frequency != null) {
      pageController!.animateToPage(
        selectedIndex!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  void updateSelectedIndexAndPage() {
    if (frequency != null) {
      setState(() {
        selectedIndex = widget.tuningType.tuning
            .indexWhere((element) => element.title == filteredNote());
      });

      pageController!.animateToPage(
        selectedIndex!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  String filteredNote() {
    if (frequency != null) {
      if (frequency! > 247) {
        return 'E3';
      } else if (frequency! > 220.5) {
        return 'B';
      } else if (frequency! > 170.5) {
        return 'G';
      } else if (frequency! > 128) {
        return 'D';
      } else if (frequency! > 96.2) {
        return 'A';
      } else {
        return 'E1';
      }
    }
    return '';
  }
}
