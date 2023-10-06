import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/data/models/instrument_model.dart';
import 'tuning_widget.dart';

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
  final _pageController = PageController(
    viewportFraction: 0.24,
    initialPage: 0,
  );

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(
      () {
        int newIndex = _pageController.page?.round() ?? 0;
        if (newIndex != _selectedIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        }
      },
    );
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
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _pageController.animateToPage(
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
        TuningWidget(tuningType: listTuningTypes[_selectedIndex]),
      ],
    );
  }
}
