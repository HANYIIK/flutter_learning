import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';

/// 关于页面
/// 演示：简单的信息展示页面
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Logo
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1),
                    const Color(0xFF8B5CF6),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Icon(
                  Iconsax.code_circle,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(24),
            
            const Text(
              'Flutter 教学项目',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(8),
            const Text(
              'v1.0.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            
            const Gap(32),
            
            const Text(
              '一个完整的 Flutter 入门教学项目，展示了 Flutter 开发的各种核心概念和最佳实践。',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            
            const Gap(32),
            
            // 功能特性
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '主要特性',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    _buildFeature(Iconsax.box, '基础组件教学'),
                    _buildFeature(Iconsax.electricity, '动画效果演示'),
                    _buildFeature(Iconsax.edit, '表单与输入'),
                    _buildFeature(Iconsax.menu_board, '列表与网格'),
                    _buildFeature(Iconsax.routing, 'GetX 路由管理'),
                    _buildFeature(Iconsax.chart, 'GetX 状态管理'),
                  ],
                ),
              ),
            ),
            
            const Gap(24),
            
            // 技术栈
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '技术栈',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    _buildTech('Flutter', 'SDK'),
                    _buildTech('GetX', '状态管理 + 路由'),
                    _buildTech('Iconsax', '图标库'),
                    _buildTech('Google Fonts', '字体'),
                    _buildTech('flutter_animate', '动画'),
                  ],
                ),
              ),
            ),
            
            const Gap(32),
            
            // 联系方式（可选）
            OutlinedButton.icon(
              onPressed: () {
                Get.snackbar('提示', '感谢您的关注！');
              },
              icon: const Icon(Iconsax.heart),
              label: const Text('给我们反馈'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            
            const Gap(16),
            
            Text(
              '© 2024 Flutter 教学项目',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF8B5CF6)),
          const Gap(12),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildTech(String name, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

