import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/presentation/tune/providers/tune_provider.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/select_instrument_widget.dart';
import 'package:m_s_afinador/app/presentation/tune/views/widgets/string_cipher_widget.dart';
import 'package:m_s_afinador/app/widgets/icon_widget.dart';
import '../../states/list_tuning/list_tuning_types_state.dart';
import 'tuning_bar_widget.dart';
import 'tuning_types_widget.dart';

class TuneComponent extends ConsumerStatefulWidget {
  const TuneComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuneComponentState();
}

class _TuneComponentState extends ConsumerState<TuneComponent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(listTuningTypesProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listTuningTypesProvider);

    if (state is LoadingListTuningTypesState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuccessListTuningTypesState) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 53),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(image: 'assets/icons/guitar.png'),
                SizedBox(width: 4),
                //DropdownButtonWidget(),
                SelectInstrumentWidget(),
              ],
            ),
            const SizedBox(height: 25),
            TuningTypesWidget(tuningTypes: state.data),
            const StringCipherWidget(),
            const Text(
              'In tune!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6CE8DC),
                fontSize: 20,
                height: 0,
              ),
            ),
            const Text(
              '196.00 Hz',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFC2C2C2),
                fontSize: 14,
                height: 0,
              ),
            ),
            const SizedBox(height: 19),
            const TuningBarWidget(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
