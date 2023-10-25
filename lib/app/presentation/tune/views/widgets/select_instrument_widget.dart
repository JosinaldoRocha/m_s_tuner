import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/widgets/dropdown_button_widget.dart';
import '../../../../data/models/instrument_model.dart';
import '../../../../widgets/icon_widget.dart';

class SelectInstrumentWidget extends ConsumerStatefulWidget {
  const SelectInstrumentWidget({
    super.key,
    required this.onTap,
    required this.instrument,
    required this.instrumentList,
  });
  final Function(InstrumentModel)? onTap;
  final InstrumentModel instrument;
  final List<InstrumentModel> instrumentList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectInstrumentWidgetState();
}

class _SelectInstrumentWidgetState
    extends ConsumerState<SelectInstrumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconWidget(image: 'assets/icons/guitar.png'),
          const SizedBox(width: 4),
          DropdownButtonWidget(
            value: widget.instrument,
            hintText: widget.instrument.title,
            items: widget.instrumentList.map(
              (item) {
                return DropdownMenuItem<InstrumentModel>(
                  value: item,
                  child: Text(item.title),
                );
              },
            ).toList(),
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
