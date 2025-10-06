import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_ios_app/models/user.dart';
import 'package:my_first_ios_app/services/auth_service.dart';
import 'package:my_first_ios_app/utils/logger.dart';

/// 认证控制器
/// 管理登录状态和用户信息
class AuthController extends GetxController {
  final authService = AuthService();

  // 是否已登录
  var isLoggedIn = false.obs;

  // 是否正在加载
  var isLoading = false.obs;

  // 当前用户
  Rx<User?> currentUser = Rx<User?>(null);

  // Token
  var token = ''.obs;

  // 用户角色
  var userRole = ''.obs;

  // 深色模式状态
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  /// 检查登录状态
  Future<void> checkLoginStatus() async {
    isLoading.value = true;
    try {
      final loggedIn = await authService.isLoggedIn();
      isLoggedIn.value = loggedIn;

      if (loggedIn) {
        // 加载用户信息
        currentUser.value = await authService.getLocalUser();
        token.value = await authService.getToken() ?? '';
        userRole.value = await authService.getUserRole() ?? '';
        isDarkMode.value = await authService.isDarkMode();
      }
    } catch (e) {
      Log.e('检查登录状态失败', e);
    } finally {
      isLoading.value = false;
    }
  }

  /// Apple 登录
  Future<bool> signInWithApple() async {
    isLoading.value = true;
    try {
      final user = await authService.signInWithApple();
      currentUser.value = user;
      isLoggedIn.value = true;
      token.value = await authService.getToken() ?? '';
      userRole.value = await authService.getUserRole() ?? '';

      Get.snackbar(
        '登录成功',
        '欢迎，${user.name}！',
        duration: const Duration(seconds: 2),
      );

      return true;
    } catch (e) {
      // 显示详细错误信息
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      Get.dialog(
        AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red),
              SizedBox(width: 8),
              Text('Apple 登录失败'),
            ],
          ),
          content: SingleChildScrollView(
            child: Text(errorMessage, style: const TextStyle(fontSize: 14)),
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('我知道了')),
          ],
        ),
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// 邮箱密码登录
  Future<bool> signInWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      final user = await authService.signInWithEmail(email, password);
      currentUser.value = user;
      isLoggedIn.value = true;
      token.value = await authService.getToken() ?? '';
      userRole.value = await authService.getUserRole() ?? '';

      Get.snackbar(
        '登录成功',
        '欢迎，${user.name}！',
        duration: const Duration(seconds: 2),
      );

      return true;
    } catch (e) {
      Get.snackbar('登录失败', e.toString(), duration: const Duration(seconds: 3));
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// 退出登录
  Future<void> signOut() async {
    await authService.signOut();
    isLoggedIn.value = false;
    currentUser.value = null;
    token.value = '';
    userRole.value = '';

    Get.snackbar('已退出', '您已成功退出登录', duration: const Duration(seconds: 2));
  }

  /// 更新用户信息
  Future<void> updateUser(User user) async {
    await authService.updateUserInfo(user);
    currentUser.value = user;
  }

  /// 切换深色模式
  Future<void> toggleDarkMode() async {
    isDarkMode.value = !isDarkMode.value;
    await authService.setDarkMode(isDarkMode.value);
    Get.snackbar(
      '主题已切换',
      isDarkMode.value ? '深色模式' : '浅色模式',
      duration: const Duration(seconds: 1),
    );
  }
}
