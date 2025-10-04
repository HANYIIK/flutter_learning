import 'package:get/get.dart';

/// 用户控制器
/// 演示全局状态管理：用户信息、主题切换等
class UserController extends GetxController {
  // 用户信息
  var userName = 'Flutter 学习者'.obs;
  var userEmail = 'learner@flutter.dev'.obs;
  var userAvatar = '👨‍💻'.obs;

  // 是否深色模式
  var isDarkMode = false.obs;

  // 更新用户名
  void updateName(String name) {
    userName.value = name;
  }

  // 更新邮箱
  void updateEmail(String email) {
    userEmail.value = email;
  }

  // 更新头像
  void updateAvatar(String avatar) {
    userAvatar.value = avatar;
  }

  // 切换主题
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.snackbar(
      '主题已切换',
      isDarkMode.value ? '深色模式' : '浅色模式',
      duration: const Duration(seconds: 1),
    );
  }

  // 退出登录
  void logout() {
    userName.value = '游客';
    userEmail.value = '';
    userAvatar.value = '👤';
    Get.snackbar('已退出', '您已退出登录');
  }
}
