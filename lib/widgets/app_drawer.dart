import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:my_first_ios_app/controllers/auth_controller.dart';
import 'package:my_first_ios_app/routes/app_routes.dart';
import 'package:my_first_ios_app/constants/colors.dart';

/// 全局共享的抽屉组件
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 抽屉头部（用户信息）
          Container(
            height: 200,
            decoration: BoxDecoration(gradient: AppColors.purpleGradient),
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        authController.currentUser.value?.avatar ?? '👤',
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                Obx(
                  () => Text(
                    authController.currentUser.value?.name ?? '游客',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(4),
                Obx(
                  () => Text(
                    authController.currentUser.value?.email ?? '',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 菜单项
          _buildDrawerItem(
            context,
            icon: Iconsax.user,
            title: '个人资料',
            subtitle: '查看和编辑个人信息',
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRoutes.userProfile);
            },
          ),

          _buildDrawerItem(
            context,
            icon: Iconsax.setting_2,
            title: '系统设置',
            subtitle: '应用偏好设置',
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRoutes.settings);
            },
          ),

          _buildDrawerItem(
            context,
            icon: Iconsax.info_circle,
            title: '关于',
            subtitle: '应用信息和版本',
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRoutes.about);
            },
          ),

          const Divider(),

          // 退出登录
          _buildDrawerItem(
            context,
            icon: Iconsax.logout,
            title: '退出登录',
            subtitle: '安全退出当前账户',
            iconColor: AppColors.error,
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog(context, authController);
            },
          ),
        ],
      ),
    );
  }

  // 抽屉菜单项
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, color: iconColor),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Icon(
        Iconsax.arrow_right_3,
        color: iconColor ?? Colors.grey,
        size: 18,
      ),
      onTap: onTap,
    );
  }

  // 退出登录确认对话框
  void _showLogoutDialog(BuildContext context, AuthController controller) {
    Get.dialog(
      AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出登录吗？这将清除本地存储的所有数据。'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('取消')),
          FilledButton(
            onPressed: () async {
              Get.back(); // 先关闭 Dialog
              await controller.signOut(); // 退出登录
              Get.offAllNamed(AppRoutes.login); // 跳转到登录页
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('退出登录'),
          ),
        ],
      ),
    );
  }
}
