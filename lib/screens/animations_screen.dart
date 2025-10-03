import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gap/gap.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画效果'),
        backgroundColor: const Color(0xFFEC4899),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Flutter Animate 动画
          _buildSection(
            title: 'Flutter Animate',
            icon: Iconsax.flash_1,
            child: Column(
              children: [
                // 淡入动画
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Iconsax.star, color: Colors.blue),
                      Gap(8),
                      Text('淡入动画'),
                    ],
                  ),
                ).animate().fadeIn(duration: 1000.ms),
                
                const Gap(16),
                
                // 滑动动画
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Iconsax.arrow_right, color: Colors.green),
                      Gap(8),
                      Text('从左滑入'),
                    ],
                  ),
                ).animate().slideX(begin: -1, duration: 800.ms),
                
                const Gap(16),
                
                // 缩放动画
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Iconsax.size, color: Colors.orange),
                      Gap(8),
                      Text('缩放动画'),
                    ],
                  ),
                )
                    .animate()
                    .scale(duration: 800.ms)
                    .then()
                    .shimmer(duration: 1000.ms),
                
                const Gap(16),
                
                // 组合动画
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      '组合动画效果',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .scale(duration: 500.ms)
                    .then()
                    .shake(),
              ],
            ),
          ),
          
          const Gap(24),
          
          // 文字动画
          _buildSection(
            title: '文字动画',
            icon: Iconsax.text,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 打字机效果
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      '欢迎来到 Flutter 世界！',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 3,
                ),
                
                const Gap(24),
                
                // 淡入淡出效果
                AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      '美观',
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    FadeAnimatedText(
                      '快速',
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    FadeAnimatedText(
                      '强大',
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                  pause: const Duration(milliseconds: 500),
                  repeatForever: true,
                ),
                
                const Gap(24),
                
                // 波浪效果
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flutter 很酷！',
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEC4899),
                      ),
                    ),
                  ],
                  repeatForever: true,
                ),
              ],
            ),
          ),
          
          const Gap(24),
          
          // Shimmer 加载效果
          _buildSection(
            title: 'Shimmer 加载效果',
            icon: Iconsax.flash_circle,
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Gap(12),
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Gap(12),
                      Container(
                        width: 200,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                const Text(
                  '☝️ 这是常见的内容加载动画效果',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          
          const Gap(24),
          
          // 交互动画
          _buildSection(
            title: '交互动画',
            icon: Iconsax.finger_cricle,
            child: Column(
              children: [
                // 可展开的容器
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: _isExpanded ? 150 : 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF6366F1),
                          const Color(0xFF8B5CF6),
                        ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '点击展开/收起',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    AnimatedRotation(
                                      duration: const Duration(milliseconds: 300),
                                      turns: _isExpanded ? 0.5 : 0,
                                      child: const Icon(
                                        Iconsax.arrow_down,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                if (_isExpanded) ...[
                                  const Gap(16),
                                  const Text(
                                    '这是一个使用 AnimatedContainer 实现的动画效果。当你点击时，容器会平滑地展开或收起。',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const Gap(24),
                
                // 旋转的图标
                RotationTransition(
                  turns: _controller,
                  child: const Icon(
                    Iconsax.setting_2,
                    size: 60,
                    color: Color(0xFF6366F1),
                  ),
                ),
                const Gap(8),
                const Text(
                  '持续旋转的图标',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFFEC4899)),
                const Gap(8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(16),
            child,
          ],
        ),
      ),
    );
  }
}

