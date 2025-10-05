import 'package:my_first_ios_app/models/user.dart';

/// 用户服务
/// 模拟用户相关的 API 请求
class UserService {
  /// 登录（模拟）
  Future<User> login(String email, String password) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));

    // 模拟登录验证
    if (email.isEmpty || password.isEmpty) {
      throw Exception('邮箱和密码不能为空');
    }

    if (password.length < 6) {
      throw Exception('密码长度不能少于6位');
    }

    // 返回模拟用户数据
    return User(
      id: 'user_001',
      name: 'Flutter 学习者',
      email: email,
      avatar: '👨‍💻',
      createdAt: DateTime.now(),
    );
  }

  /// 注册（模拟）
  Future<User> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('所有字段都必须填写');
    }

    if (!email.contains('@')) {
      throw Exception('邮箱格式不正确');
    }

    if (password.length < 6) {
      throw Exception('密码长度不能少于6位');
    }

    return User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      avatar: '👨‍💻',
      createdAt: DateTime.now(),
    );
  }

  /// 获取用户信息（模拟）
  Future<User> getUserInfo(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return User(
      id: userId,
      name: 'Flutter 学习者',
      email: 'learner@flutter.dev',
      avatar: '👨‍💻',
      createdAt: DateTime(2024, 1, 1),
    );
  }

  /// 更新用户信息（模拟）
  Future<User> updateUserInfo(String userId, Map<String, dynamic> data) async {
    await Future.delayed(const Duration(milliseconds: 600));

    return User(
      id: userId,
      name: data['name'] as String? ?? 'Flutter 学习者',
      email: data['email'] as String? ?? 'learner@flutter.dev',
      avatar: data['avatar'] as String? ?? '👨‍💻',
      createdAt: DateTime.now(),
    );
  }

  /// 退出登录（模拟）
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // 清除本地存储的用户信息
  }
}
