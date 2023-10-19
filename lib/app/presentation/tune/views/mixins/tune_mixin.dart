import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../constants/instrument_model.dart';
import '../../providers/tune_provider.dart';
import '../../states/microphone_permission/microphone_permission_state.dart';
import '../widgets/tune_component.dart';

mixin TuneMixin on ConsumerState<TuneComponent> {
  double? frequency;
  FlutterFft flutterFft = FlutterFft();

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
      frequency = flutterFft.getFrequency;
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
      initialInstrument = value;
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
          showDialog(
            context: context,
            builder: (context) => _buildAlertDialog(next, context),
          );
        }
      },
    );
  }

  AlertDialog _buildAlertDialog(
      FailureMicrophonePermissionState next, BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(15),
      content: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              next.errorMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
              child: const Text('Ir para as configurações'),
            ),
          ],
        ),
      ),
    );
  }
}
