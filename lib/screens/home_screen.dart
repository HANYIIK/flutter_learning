import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'basic_widgets_screen.dart';
import 'animations_screen.dart';
import 'forms_screen.dart';
import 'lists_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    BasicWidgetsScreen(),
    AnimationsScreen(),
    FormsScreen(),
    ListsScreen(),
  ];

  final List<Map<String, dynamic>> _navItems = const [
    {
      'icon': Iconsax.box,
      'label': '基础组件',
      'color': Color(0xFF6366F1),
    },
    {
      'icon': Iconsax.electricity,
      'label': '动画效果',
      'color': Color(0xFFEC4899),
    },
    {
      'icon': Iconsax.edit,
      'label': '表单输入',
      'color': Color(0xFF10B981),
    },
    {
      'icon': Iconsax.menu_board,
      'label': '列表网格',
      'color': Color(0xFFF59E0B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: _navItems[_currentIndex]['color'] as Color,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          elevation: 0,
          items: _navItems.map((item) {
            final index = _navItems.indexOf(item);
            final isSelected = _currentIndex == index;
            
            return BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: isSelected
                    ? BoxDecoration(
                        color: (item['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 24,
                      color: isSelected 
                          ? item['color'] as Color 
                          : Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        color: isSelected 
                            ? item['color'] as Color 
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ).animate(
                target: isSelected ? 1 : 0,
              ).scale(
                duration: 200.ms,
                begin: const Offset(1, 1),
                end: const Offset(1.05, 1.05),
              ),
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }
}

