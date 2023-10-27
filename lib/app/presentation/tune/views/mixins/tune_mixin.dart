import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/models/instrument_model.dart';
import '../../providers/tune_provider.dart';
import '../../states/microphone_permission/microphone_permission_state.dart';
import '../widgets/tune_component.dart';

mixin TuneMixin on ConsumerState<TuneComponent> {
  double? frequency;
  FlutterFft flutterFft = FlutterFft();
  String? note;
  InstrumentModel? instrument;

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
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(listInstrumentsProvider.notifier).loadInstruments();
      ref.read(microphoneProvider.notifier).loadPermission();
      // frequency = flutterFft.getFrequency;
    });
  }

  @override
  void dispose() {
    if (flutterFft.getIsRecording) {
      flutterFft.stopRecorder();
    }
    super.dispose();
  }

  void onTap(value) {
    setState(() {
      instrument = value;
    });
  }

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

  String filteredNote() {
    if (frequency! > 247) {
      note = 'E3';
    } else if (frequency! < 247 && frequency! > 220.5) {
      note = 'B';
    } else if (frequency! < 220.5 && frequency! > 170.5) {
      note = 'G';
    } else if (frequency! < 170.5 && frequency! > 128) {
      note = 'D';
    } else if (frequency! < 128 && frequency! > 96.2) {
      note = 'A';
    } else {
      note = 'E1';
    }
    return note!;
  }
}
