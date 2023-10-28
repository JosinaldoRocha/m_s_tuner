import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/instrument_model.dart';
import '../../../../presentation/tune/providers/tune_provider.dart';
import '../../../../presentation/tune/views/widgets/select_instrument_widget.dart';
import '../../states/list_instruments/list_instruments_state.dart';
import 'tuning_types_widget.dart';

class TuneComponent extends ConsumerStatefulWidget {
  const TuneComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuneComponentState();
}

class _TuneComponentState extends ConsumerState<TuneComponent> {
  InstrumentModel? instrument;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(listInstrumentsProvider.notifier).loadInstruments();
    });
  }

  void onTap(value) {
    setState(() {
      instrument = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listInstrumentsProvider);

    if (state is LoadingListInstrumentsState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuccessListInstrumentsState) {
      final initialInstrument =
          state.data.firstWhere((item) => item.id == 'violao');

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 53),
        child: Column(
          children: [
            SelectInstrumentWidget(
              instrumentList: state.data,
              instrument: instrument ?? initialInstrument,
              onTap: onTap,
            ),
            TuningTypesWidget(
              instrument: instrument ?? initialInstrument,
            ),
            const Text(
              'In tune!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6CE8DC),
                fontSize: 20,
                height: 0,
              ),
            ),
            const SizedBox(height: 25),
            const SizedBox(height: 19),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
