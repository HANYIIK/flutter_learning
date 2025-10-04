import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_first_ios_app/screens/basic_widgets_screen.dart';
import 'package:my_first_ios_app/screens/animations_screen.dart';
import 'package:my_first_ios_app/screens/forms_screen.dart';
import 'package:my_first_ios_app/screens/lists_screen.dart';

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
    {'icon': Iconsax.box, 'label': '基础组件', 'color': Color(0xFF6366F1)},
    {'icon': Iconsax.electricity, 'label': '动画效果', 'color': Color(0xFFEC4899)},
    {'icon': Iconsax.edit, 'label': '表单输入', 'color': Color(0xFF10B981)},
    {'icon': Iconsax.menu_board, 'label': '列表网格', 'color': Color(0xFFF59E0B)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _navItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isSelected = _currentIndex == index;

                return Expanded(
                  child:
                      InkWell(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: isSelected
                                      ? BoxDecoration(
                                          color: (item['color'] as Color)
                                              .withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        )
                                      : null,
                                  child: Icon(
                                    item['icon'] as IconData,
                                    size: 22,
                                    color: isSelected
                                        ? item['color'] as Color
                                        : Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item['label'] as String,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isSelected
                                        ? item['color'] as Color
                                        : Colors.grey,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate(target: isSelected ? 1 : 0)
                          .scale(
                            duration: 200.ms,
                            begin: const Offset(1, 1),
                            end: const Offset(1.05, 1.05),
                          ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
