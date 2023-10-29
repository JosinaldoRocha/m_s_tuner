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

  void updateSelectedIndexAndPage() {
    if (frequency != null) {
      setState(() {
        selectedIndex = widget.tuningType.tuning
            .indexWhere((element) => element.id == filteredNote());
      });

      if (selectedIndex! >= 0) {
        pageController!.animateToPage(
          selectedIndex!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      }
    }
  }

  String filteredNote() {
    if (frequency != null) {
      if (frequency! < 31.78) {
        return 'B0';
      } else if (frequency! < 33.67) {
        return 'C1';
      } else if (frequency! < 35.95) {
        return 'C#/Db1';
      } else if (frequency! < 37.80) {
        return 'D1';
      } else if (frequency! < 40.04) {
        return 'D#/Eb1';
      } else if (frequency! < 42.42) {
        return 'E1';
      } else if (frequency! < 44.95) {
        return 'F1';
      } else if (frequency! < 47.62) {
        return 'F#/Gb1';
      } else if (frequency! < 50.45) {
        return 'G1';
      } else if (frequency! < 53.45) {
        return 'G#/Ab1';
      } else if (frequency! < 56.63) {
        return 'A1';
      } else if (frequency! < 60.00) {
        return 'A#/Bb1';
      } else if (frequency! < 63.57) {
        return 'B1';
      } else if (frequency! < 67.35) {
        return 'C2';
      } else if (frequency! < 71.36) {
        return 'C#/Db2';
      } else if (frequency! < 75.60) {
        return 'D2';
      } else if (frequency! < 80.09) {
        return 'D#/Eb2';
      } else if (frequency! < 84.86) {
        return 'E2';
      } else if (frequency! < 89.90) {
        return 'F2';
      } else if (frequency! < 95.25) {
        return 'F#/Gb2';
      } else if (frequency! < 100.91) {
        return 'G2';
      } else if (frequency! < 106.91) {
        return 'G#/Ab2';
      } else if (frequency! < 113.27) {
        return 'A2';
      } else if (frequency! < 120.00) {
        return 'A#/Bb2';
      } else if (frequency! < 127.14) {
        return 'B2';
      } else if (frequency! < 134.70) {
        return 'C3';
      } else if (frequency! < 142.71) {
        return 'C#/Db3';
      } else if (frequency! < 151.19) {
        return 'D3';
      } else if (frequency! < 160.18) {
        return 'D#/Eb3';
      } else if (frequency! < 169.71) {
        return 'E3';
      } else if (frequency! < 179.80) {
        return 'F3';
      } else if (frequency! < 190.50) {
        return 'F#/Gb3';
      } else if (frequency! < 201.82) {
        return 'G3';
      } else if (frequency! < 213.82) {
        return 'G#/Ab3';
      } else if (frequency! < 226.54) {
        return 'A3';
      } else if (frequency! < 240.01) {
        return 'A#/Bb3';
      } else if (frequency! < 254.285) {
        return 'B3';
      } else if (frequency! < 269.40) {
        return 'C4';
      } else if (frequency! < 285.42) {
        return 'C#/Db4';
      } else if (frequency! < 302.39) {
        return 'D4';
      } else if (frequency! < 320.38) {
        return 'D#/Eb4';
      } else if (frequency! < 339.43) {
        return 'E4';
      } else if (frequency! < 359.61) {
        return 'F4';
      } else if (frequency! < 380.99) {
        return 'F#/Gb4';
      } else if (frequency! < 403.65) {
        return 'G4';
      } else if (frequency! < 427.65) {
        return 'G#/Ab4';
      } else if (frequency! < 453.08) {
        return 'A4';
      } else if (frequency! < 480.02) {
        return 'A#/Bb4';
      } else if (frequency! < 508.56) {
        return 'B4';
      } else if (frequency! < 538.81) {
        return 'C5';
      } else if (frequency! < 570.85) {
        return 'C#/Db5';
      } else if (frequency! < 604.79) {
        return 'D5';
      } else if (frequency! < 640.75) {
        return 'D#/Eb5';
      } else if (frequency! < 678.86) {
        return 'E5';
      } else if (frequency! < 719.22) {
        return 'F5';
      } else if (frequency! < 761.99) {
        return 'F#/Gb5';
      } else if (frequency! < 807.30) {
        return 'G5';
      } else if (frequency! < 855.305) {
        return 'G#/Ab5';
      } else if (frequency! < 906.16) {
        return 'A5';
      } else if (frequency! < 960.05) {
        return 'A#/Bb5';
      } else {
        return 'B5';
      }
    }
    return '';
  }
}
