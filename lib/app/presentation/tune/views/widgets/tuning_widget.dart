import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_s_afinador/app/data/models/tuning_types_model.dart';

class TuningWidget extends ConsumerStatefulWidget {
  const TuningWidget({
    super.key,
    required this.tuningType,
  });
  final TuningTypesModel tuningType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TuningWidgetState();
}

class _TuningWidgetState extends ConsumerState<TuningWidget> {
  final PageController _pageController = PageController(
    viewportFraction: 0.10,
    initialPage: 2,
  );
  int? _selectedIndex;

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
                child: Text(
                  widget.tuningType.tuning.notes[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: _selectedIndex == index ? 0.9 : null,
                    color: _selectedIndex == index
                        ? const Color(0xFF6CE8DC)
                        : const Color(0xFFC2C2C2),
                    fontSize: _selectedIndex == index ? 56 : 32,
                  ),
                ),
              );
            },
            itemCount: widget.tuningType.tuning.notes.length,
          ),
        ),
      ),
    );
  }
}
