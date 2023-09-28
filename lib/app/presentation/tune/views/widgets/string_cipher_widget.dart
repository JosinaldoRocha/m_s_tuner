import 'package:flutter/material.dart';

class StringCipherWidget extends StatefulWidget {
  const StringCipherWidget({super.key});

  @override
  State<StringCipherWidget> createState() => _StringCipherWidgetState();
}

class _StringCipherWidgetState extends State<StringCipherWidget> {
  final PageController _pageController = PageController(
    viewportFraction: 0.10,
    initialPage: 2,
  );
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int newIndex = _pageController.page?.round() ?? 0;
      if (newIndex != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex;
        });
      }
    });
  }

  final _stringCipher = ['E', 'A', 'D', 'G', 'B', 'E'];

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
                  _stringCipher[index],
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
            itemCount: _stringCipher.length,
          ),
        ),
      ),
    );
  }

  Text _buildTextStringCipher(int selectedIndex, int index) {
    return Text(
      _stringCipher[index],
      textAlign: TextAlign.center,
      style: TextStyle(
        height: _selectedIndex == index ? 0.9 : null,
        color: _selectedIndex == index ? const Color(0xFF6CE8DC) : Colors.white,
        fontSize: _selectedIndex == index ? 56 : 32,
      ),
    );
  }
}
