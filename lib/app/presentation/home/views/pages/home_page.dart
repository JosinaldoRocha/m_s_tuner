import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/presentation/home/widgets/bottom_navigation_bar_widget.dart';
import '../../../tune/views/widgets/tune_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: _buildBoxDecoration(), child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }

  final List<Widget> _screens = [
    const CenterWidget(title: 'News'),
    const CenterWidget(title: 'Learn'),
    TuneComponent(),
    //const CenterWidget(title: 'Tune'),
    const CenterWidget(title: 'Tools'),
    const CenterWidget(title: 'Settings'),
  ];

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        colors: [
          Color(0xFF36363C),
          Color(0xFF1C1D22),
        ],
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xFF6CE8DC),
        ),
      ),
    );
  }
}
