import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/presentation/tune/views/mixins/tune_mixin.dart';
import '../../../../constants/instrument_model.dart';
import '../../../../presentation/tune/providers/tune_provider.dart';
import '../../../../presentation/tune/views/widgets/select_instrument_widget.dart';
import '../../states/list_instruments/list_instruments_state.dart';
import 'tuning_types_widget.dart';

class TuneComponent extends ConsumerStatefulWidget {
  const TuneComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuneComponentState();
}

class _TuneComponentState extends ConsumerState<TuneComponent> with TuneMixin {
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
              '${frequency != null ? frequency!.toStringAsFixed(2) : ''} Hz',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFC2C2C2),
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
}
