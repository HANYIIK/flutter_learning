import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:my_first_ios_app/controllers/user_controller.dart';

/// 设置页面
/// 演示：GetX 响应式状态、开关组件
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        backgroundColor: const Color(0xFF10B981),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 外观设置
          const Text(
            '外观',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(8),
          Card(
            child: Column(
              children: [
                Obx(
                  () => SwitchListTile(
                    title: const Text('深色模式'),
                    subtitle: Text(
                      userController.isDarkMode.value ? '已启用深色主题' : '已启用浅色主题',
                    ),
                    secondary: Icon(
                      userController.isDarkMode.value
                          ? Iconsax.moon
                          : Iconsax.sun_1,
                      color: const Color(0xFF10B981),
                    ),
                    value: userController.isDarkMode.value,
                    onChanged: (value) {
                      userController.toggleTheme();
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Iconsax.colorfilter,
                    color: Color(0xFF10B981),
                  ),
                  title: const Text('主题颜色'),
                  subtitle: const Text('自定义主题色'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {
                    Get.snackbar('提示', '主题色设置功能开发中');
                  },
                ),
              ],
            ),
          ),

          const Gap(24),

          // 通知设置
          const Text(
            '通知',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('推送通知'),
                  subtitle: const Text('接收重要更新'),
                  secondary: const Icon(
                    Iconsax.notification,
                    color: Color(0xFF10B981),
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('声音'),
                  subtitle: const Text('通知提示音'),
                  secondary: const Icon(
                    Iconsax.volume_high,
                    color: Color(0xFF10B981),
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),

          const Gap(24),

          // 其他设置
          const Text(
            '其他',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Gap(8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Iconsax.shield_tick,
                    color: Color(0xFF10B981),
                  ),
                  title: const Text('隐私政策'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Iconsax.document_text,
                    color: Color(0xFF10B981),
                  ),
                  title: const Text('服务条款'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Iconsax.info_circle,
                    color: Color(0xFF10B981),
                  ),
                  title: const Text('关于'),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  onTap: () {
                    Get.toNamed('/about');
                  },
                ),
              ],
            ),
          ),

          const Gap(32),

          // 版本信息
          Center(
            child: Column(
              children: [
                Text(
                  'Flutter 教学项目',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const Gap(4),
                Text(
                  'v1.0.0',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
