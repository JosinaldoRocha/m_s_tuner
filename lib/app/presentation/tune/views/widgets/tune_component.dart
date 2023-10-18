import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../constants/instrument_model.dart';
import '../../../../presentation/tune/providers/tune_provider.dart';
import '../../../../presentation/tune/views/widgets/select_instrument_widget.dart';
import '../../states/list_instruments/list_instruments_state.dart';
import '../../states/microphone_permission/microphone_permission_state.dart';
import 'tuning_types_widget.dart';

class TuneComponent extends ConsumerStatefulWidget {
  const TuneComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuneComponentState();
}

class _TuneComponentState extends ConsumerState<TuneComponent> {
  double? frequency;
  FlutterFft flutterFft = FlutterFft();

  _initialize() async {
    await flutterFft.startRecorder();

    flutterFft.onRecorderStateChanged.listen(
      (data) => {
        if (mounted)
          {
            setState(() => frequency = data[1] as double),
          },
        flutterFft.setFrequency = frequency!,
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
          _initialize();
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listInstrumentsProvider);
    microphoneListen();

    if (state is LoadingListInstrumentsState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuccessListInstrumentsState) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 53),
        child: Column(
          children: [
            SelectInstrumentWidget(
              instrumentList: state.data,
              instrument: initialInstrument,
              onTap: onTap,
            ),
            TuningTypesWidget(instrument: initialInstrument),
            const Text(
              'In tune!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6CE8DC),
                fontSize: 20,
                height: 0,
              ),
            ),
            Text(
              frequency != null ? frequency!.toStringAsFixed(2) : '0',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFC2C2C2),
                fontSize: 14,
                height: 0,
              ),
            ),
            const SizedBox(height: 19),
          ],
        ),
      );
    } else {
      return Container();
    }
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
