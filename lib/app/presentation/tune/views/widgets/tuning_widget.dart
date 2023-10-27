import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';

class TuningWidget extends ConsumerStatefulWidget {
  const TuningWidget({
    super.key,
    required this.tuningType,
    required this.frequency,
  });
  final TuningTypesModel tuningType;
  final double? frequency;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuningWidgetState();
}

class _TuningWidgetState extends ConsumerState<TuningWidget> {
  PageController? _pageController;
  int? _selectedIndex;
  String? note;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.10,
      initialPage: (widget.tuningType.tuning.length ~/ 2) - 1,
    );
  }

  void updatePage() {
    if (widget.frequency != null) {
      _pageController!.animateToPage(
        _selectedIndex!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  void updtateSelectedIndex() {
    if (widget.frequency != null) {
      setState(() {
        _selectedIndex = widget.tuningType.tuning
            .indexWhere((element) => element.title == note);
      });
    }
  }

  String filteredNote() {
    if (widget.frequency != null) {
      if (widget.frequency! > 247) {
        note = 'E3';
      } else if (widget.frequency! > 220.5) {
        note = 'B';
      } else if (widget.frequency! > 170.5) {
        note = 'G';
      } else if (widget.frequency! > 128) {
        note = 'D';
      } else if (widget.frequency! > 96.2) {
        note = 'A';
      } else {
        note = 'E1';
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    filteredNote();
    updtateSelectedIndex();
    updatePage();

    print('selected index $_selectedIndex');
    print('initial page ${_pageController?.initialPage}');
    return Padding(
      padding: const EdgeInsets.only(
        top: 72,
        bottom: 12,
      ),
      child: SizedBox(
        height: 44,
        child: Center(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Text(
                widget.tuningType.tuning[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: _selectedIndex == index ? 0.9 : null,
                  color: _selectedIndex == index
                      ? const Color(0xFF6CE8DC)
                      : const Color(0xFFC2C2C2),
                  fontSize: _selectedIndex == index ? 56 : 32,
                ),
              );
            },
            itemCount: widget.tuningType.tuning.length,
          ),
        ),
      ),
    );
  }
}
