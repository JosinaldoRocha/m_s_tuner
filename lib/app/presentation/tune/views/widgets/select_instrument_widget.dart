import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/presentation/tune/providers/tune_provider.dart';
import 'package:m_s_afinador/app/presentation/tune/states/list_instruments/list_instruments_state.dart';
import 'package:m_s_afinador/app/widgets/dropdown_button_widget.dart';

class SelectInstrumentWidget extends ConsumerStatefulWidget {
  const SelectInstrumentWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectInstrumentWidgetState();
}

class _SelectInstrumentWidgetState
    extends ConsumerState<SelectInstrumentWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(listInstrumentsProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listInstrumentsProvider);

    return Column(
      children: [
        if (state is SuccessListInstrumentsState)
          DropdownButtonWidget(
            hintText: 'Violão',
            items: state.data.map(
              (item) {
                return DropdownMenuItem<String>(
                  value: item.title,
                  child: Text(item.title),
                );
              },
            ).toList(),
          ),
      ],
    );
  }
}
