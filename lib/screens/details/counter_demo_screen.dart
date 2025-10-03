import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../controllers/counter_controller.dart';

/// 计数器演示页面
/// 演示：GetX 最简单的状态管理
class CounterDemoScreen extends StatelessWidget {
  const CounterDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 Get.put() 创建控制器
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器演示'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                '这是 GetX 状态管理的最简单示例',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              
              // 计数显示（使用 Obx 监听状态变化）
              Obx(() => Text(
                    '${controller.count}',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6366F1),
                    ),
                  ).animate(
                    key: ValueKey(controller.count.value),
                  ).scale(
                    duration: 300.ms,
                    begin: const Offset(0.8, 0.8),
                  )),
              
              const Gap(16),
              
              Obx(() => Text(
                    controller.count.value >= 0 ? '当前计数' : '负数计数',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  )),
              
              const Gap(48),
              
              // 操作按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 减少按钮
                  FloatingActionButton(
                    onPressed: () => controller.decrement(),
                    heroTag: 'decrement',
                    backgroundColor: Colors.red,
                    child: const Icon(Iconsax.minus),
                  ),
                  const Gap(24),
                  // 重置按钮
                  FloatingActionButton(
                    onPressed: () => controller.reset(),
                    heroTag: 'reset',
                    backgroundColor: Colors.grey,
                    child: const Icon(Iconsax.refresh),
                  ),
                  const Gap(24),
                  // 增加按钮
                  FloatingActionButton(
                    onPressed: () => controller.increment(),
                    heroTag: 'increment',
                    backgroundColor: Colors.green,
                    child: const Icon(Iconsax.add),
                  ),
                ],
              ),
              
              const Gap(48),
              
              // 快捷设置
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '快速设置',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [0, 10, 50, 100].map((value) {
                          return OutlinedButton(
                            onPressed: () => controller.setValue(value),
                            child: Text('设为 $value'),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              
              const Gap(24),
              
              // 说明卡片
              Card(
                color: const Color(0xFF6366F1).withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.info_circle, color: Color(0xFF6366F1)),
                          const Gap(8),
                          const Text(
                            'GetX 状态管理',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      const Text(
                        '1. 使用 .obs 让变量变成响应式\n'
                        '2. 使用 Obx() 监听状态变化\n'
                        '3. 修改变量值会自动更新UI',
                        style: TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

