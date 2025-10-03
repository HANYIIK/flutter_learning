import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import '../../controllers/user_controller.dart';

/// 用户资料页
/// 演示：GetX 全局状态管理
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取用户控制器（从全局获取）
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.edit),
            onPressed: () {
              _showEditDialog(context, userController);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部个人信息卡片
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1),
                    const Color(0xFF8B5CF6),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // 头像
                  Obx(() => Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            userController.userAvatar.value,
                            style: const TextStyle(fontSize: 50),
                          ),
                        ),
                      )),
                  const Gap(16),
                  // 用户名
                  Obx(() => Text(
                        userController.userName.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                  const Gap(8),
                  // 邮箱
                  Obx(() => Text(
                        userController.userEmail.value,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      )),
                ],
              ),
            ),
            
            const Gap(24),
            
            // 功能列表
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Iconsax.user_edit,
                    title: '编辑资料',
                    subtitle: '修改个人信息',
                    onTap: () {
                      _showEditDialog(context, userController);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.notification,
                    title: '通知设置',
                    subtitle: '管理通知偏好',
                    onTap: () {
                      Get.snackbar('提示', '通知设置功能开发中');
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.lock,
                    title: '隐私与安全',
                    subtitle: '保护您的账户安全',
                    onTap: () {
                      Get.snackbar('提示', '安全设置功能开发中');
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.setting_2,
                    title: '应用设置',
                    subtitle: '个性化您的应用',
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                  const Gap(16),
                  const Divider(),
                  const Gap(16),
                  _buildMenuItem(
                    icon: Iconsax.logout,
                    title: '退出登录',
                    subtitle: '安全退出当前账户',
                    color: Colors.red,
                    onTap: () {
                      _showLogoutDialog(context, userController);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (color ?? const Color(0xFF6366F1)).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: color ?? const Color(0xFF6366F1),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Iconsax.arrow_right_3,
          color: color ?? Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  void _showEditDialog(BuildContext context, UserController controller) {
    final nameController = TextEditingController(text: controller.userName.value);
    final emailController = TextEditingController(text: controller.userEmail.value);

    Get.dialog(
      AlertDialog(
        title: const Text('编辑资料'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                prefixIcon: Icon(Iconsax.user),
              ),
            ),
            const Gap(16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: '邮箱',
                prefixIcon: Icon(Iconsax.sms),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              controller.updateName(nameController.text);
              controller.updateEmail(emailController.text);
              Get.back();
              Get.snackbar('成功', '资料已更新');
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, UserController controller) {
    Get.dialog(
      AlertDialog(
        title: const Text('退出登录'),
        content: const Text('确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              controller.logout();
              Get.back();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('退出'),
          ),
        ],
      ),
    );
  }
}

