import 'package:flutter/material.dart';
import '../../../widgets/icon_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.selectIndex,
    required this.onTabTapped,
  });
  final int selectIndex;
  final Function(int) onTabTapped;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.0,
            color: Color(0xFF1C1D22),
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: widget.selectIndex,
        onTap: widget.onTabTapped,
        backgroundColor: const Color(0xFF1C1D22),
        selectedItemColor: const Color(0xFF6CE8DC),
        unselectedItemColor: const Color(0xFFC2C2C2),
        selectedLabelStyle: _buildLabelStyle(),
        unselectedLabelStyle: _buildLabelStyle(),
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/news.png',
            title: 'News',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/learn.png',
            title: 'Learn',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/tune.png',
            title: 'Tune',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/tools.png',
            title: 'Tools',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/settings.png',
            title: 'Settings',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String title,
  }) {
    return BottomNavigationBarItem(
      activeIcon: Column(
        children: [
          const SizedBox(height: 8),
          IconWidget(
            image: icon,
            iconColor: const Color(0xFF6CE8DC),
          ),
          const SizedBox(height: 8),
        ],
      ),
      icon: Column(
        children: [
          const SizedBox(height: 8),
          IconWidget(image: icon),
          const SizedBox(height: 8),
        ],
      ),
      label: title,
    );
  }

  TextStyle _buildLabelStyle() {
    return const TextStyle(
      color: Color(0xFF6CE8DC),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }
}
