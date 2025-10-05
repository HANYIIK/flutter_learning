import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:my_first_ios_app/models/user.dart';

/// 认证服务
/// 处理登录、登出、Token 管理等
class AuthService {
  // SharedPreferences key 常量
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyToken = 'token';
  static const String _keyUserId = 'user_id';
  static const String _keyUserName = 'user_name';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserAvatar = 'user_avatar';
  static const String _keyUserRole = 'user_role';
  static const String _keyIsDarkMode = 'is_dark_mode';

  /// 检查 Apple 登录是否可用
  Future<bool> isAppleSignInAvailable() async {
    try {
      return await SignInWithApple.isAvailable();
    } catch (e) {
      return false;
    }
  }

  /// 使用 Apple 登录
  Future<User> signInWithApple() async {
    try {
      // 检查是否可用
      final available = await isAppleSignInAvailable();
      if (!available) {
        throw Exception(
          'Apple 登录不可用。\n'
          '请确保：\n'
          '1. 设备已登录 Apple ID\n'
          '2. 在真机上测试（模拟器可能不支持）\n'
          '3. iOS 版本 >= 13.0',
        );
      }

      // 请求 Apple 登录
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // 构建用户对象
      final userName =
          credential.givenName ??
          credential.familyName ??
          credential.email?.split('@')[0] ??
          'Apple 用户';

      final user = User(
        id:
            credential.userIdentifier ??
            'apple_${DateTime.now().millisecondsSinceEpoch}',
        name: userName,
        email: credential.email ?? 'user@privaterelay.appleid.com',
        avatar: '🍎', // Apple logo emoji
        createdAt: DateTime.now(),
      );

      // 生成模拟 Token
      final token = _generateToken(user.id);

      // 保存到本地存储
      await _saveUserToLocal(user, token, 'user');

      return user;
    } on SignInWithAppleAuthorizationException catch (e) {
      // Apple 登录特定错误
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          throw Exception('登录已取消');
        case AuthorizationErrorCode.failed:
          throw Exception('登录失败，请重试');
        case AuthorizationErrorCode.invalidResponse:
          throw Exception('收到无效响应');
        case AuthorizationErrorCode.notHandled:
          throw Exception('请求未处理');
        case AuthorizationErrorCode.unknown:
          throw Exception(
            'Apple 登录配置错误。\n\n'
            '💡 解决方法：\n'
            '1. 在 Xcode 中打开项目\n'
            '2. 选择 Runner target\n'
            '3. 在 Signing & Capabilities 中\n'
            '4. 点击 + Capability\n'
            '5. 添加 "Sign in with Apple"\n\n'
            '或者使用邮箱登录进行测试',
          );
        default:
          throw Exception('Apple 登录失败: ${e.message}');
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Apple 登录失败: $e');
    }
  }

  /// 模拟邮箱密码登录（用于测试）
  Future<User> signInWithEmail(String email, String password) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 1000));

    // 简单的验证
    if (email.isEmpty || password.isEmpty) {
      throw Exception('邮箱和密码不能为空');
    }

    if (password.length < 6) {
      throw Exception('密码长度不能少于6位');
    }

    // 创建用户对象
    final user = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: email.split('@')[0],
      email: email,
      avatar: '👨‍💻',
      createdAt: DateTime.now(),
    );

    // 生成 Token
    final token = _generateToken(user.id);

    // 保存到本地存储
    await _saveUserToLocal(user, token, 'user');

    return user;
  }

  /// 退出登录
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // 清除所有本地数据
  }

  /// 检查是否已登录
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  /// 获取本地存储的用户信息
  Future<User?> getLocalUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;
      if (!isLoggedIn) return null;

      final userId = prefs.getString(_keyUserId);
      final userName = prefs.getString(_keyUserName);
      final userEmail = prefs.getString(_keyUserEmail);
      final userAvatar = prefs.getString(_keyUserAvatar);

      if (userId == null || userName == null) return null;

      return User(
        id: userId,
        name: userName,
        email: userEmail ?? '',
        avatar: userAvatar ?? '👨‍💻',
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }

  /// 获取 Token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  /// 获取用户角色
  Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserRole);
  }

  /// 获取深色模式状态
  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsDarkMode) ?? false;
  }

  /// 设置深色模式
  Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, isDark);
  }

  /// 更新用户信息
  Future<void> updateUserInfo(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserName, user.name);
    await prefs.setString(_keyUserEmail, user.email);
    await prefs.setString(_keyUserAvatar, user.avatar);
  }

  /// 保存用户到本地存储
  Future<void> _saveUserToLocal(User user, String token, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setString(_keyToken, token);
    await prefs.setString(_keyUserId, user.id);
    await prefs.setString(_keyUserName, user.name);
    await prefs.setString(_keyUserEmail, user.email);
    await prefs.setString(_keyUserAvatar, user.avatar);
    await prefs.setString(_keyUserRole, role);
  }

  /// 生成模拟 Token
  String _generateToken(String userId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'token_${userId}_$timestamp';
  }
}
