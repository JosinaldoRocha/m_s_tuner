import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/data/models/instrument_model.dart';
import '../tuning_widget.dart';

class TuningTypesWidget extends StatefulWidget {
  const TuningTypesWidget({
    super.key,
    required this.instrument,
  });
  final InstrumentModel instrument;

  @override
  State<TuningTypesWidget> createState() => _TuningTypesWidgetState();
}

class _TuningTypesWidgetState extends State<TuningTypesWidget> {
  PageController? _pageController;
  int? _selectedIndex;

  void updtateSelectedIndex() {
    setState(() {
      _selectedIndex = widget.instrument.tuningTypes
          .indexWhere((element) => element.id == 'tuningStandard');
    });
  }

  @override
  void initState() {
    super.initState();
    updtateSelectedIndex();

    _pageController = PageController(
      viewportFraction: 0.24,
      initialPage: _selectedIndex!,
    );
  }

  @override
  void didUpdateWidget(TuningTypesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.instrument != oldWidget.instrument) {
      updtateSelectedIndex();
      _pageController!.animateToPage(
        _selectedIndex!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final listTuningTypes = widget.instrument.tuningTypes;

    return Column(
      children: [
        SizedBox(
          height: 28,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _pageController!.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: 28,
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? const Color(0xFF244C52)
                            : null,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          listTuningTypes[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF6CE8DC),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: listTuningTypes.length,
          ),
        ),
        TuningWidget(tuningType: listTuningTypes[_selectedIndex!]),
      ],
    );
  }
}
