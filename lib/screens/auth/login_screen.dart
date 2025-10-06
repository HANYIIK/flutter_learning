import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_first_ios_app/controllers/auth_controller.dart';
import 'package:my_first_ios_app/constants/colors.dart';
import 'package:my_first_ios_app/utils/validators.dart';
import 'package:my_first_ios_app/routes/app_routes.dart';
import 'dart:io' show Platform;

/// 登录页面
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isAppleSignInAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkAppleSignInAvailability();
  }

  Future<void> _checkAppleSignInAvailability() async {
    if (Platform.isIOS || Platform.isMacOS) {
      final authController = Get.find<AuthController>();
      final available = await authController.authService
          .isAppleSignInAvailable();
      setState(() {
        _isAppleSignInAvailable = available;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleEmailLogin() async {
    if (_formKey.currentState!.validate()) {
      final authController = Get.find<AuthController>();
      final success = await authController.signInWithEmail(
        _emailController.text,
        _passwordController.text,
      );

      if (success) {
        Get.offAllNamed(AppRoutes.home);
      }
    }
  }

  Future<void> _handleAppleLogin() async {
    final authController = Get.find<AuthController>();
    final success = await authController.signInWithApple();

    if (success) {
      Get.offAllNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.purpleGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo 和标题
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Iconsax.mobile_programming,
                      size: 50,
                      color: Color(0xFF6366F1),
                    ),
                  ).animate().scale(
                    duration: 500.ms,
                    curve: Curves.easeOutBack,
                  ),

                  const Gap(24),

                  const Text(
                    'Flutter 教学项目',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.3),

                  const Gap(8),

                  Text(
                    '欢迎回来，请登录以继续',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ).animate().fadeIn(delay: 200.ms),

                  const Gap(40),

                  // 登录表单卡片
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // 邮箱输入
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: '邮箱',
                              hintText: '请输入邮箱',
                              prefixIcon: const Icon(Iconsax.sms),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),

                          const Gap(16),

                          // 密码输入
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: '密码',
                              hintText: '请输入密码',
                              prefixIcon: const Icon(Iconsax.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: Validators.password,
                          ),

                          const Gap(24),

                          // 登录按钮
                          Obx(
                            () => SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: authController.isLoading.value
                                    ? null
                                    : _handleEmailLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: authController.isLoading.value
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        '登录',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),

                          const Gap(16),

                          // 分隔线
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey[300])),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  '或',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.grey[300])),
                            ],
                          ),

                          const Gap(16),

                          // Apple 登录按钮（仅 iOS/macOS 且可用）
                          if ((Platform.isIOS || Platform.isMacOS) &&
                              _isAppleSignInAvailable)
                            Obx(
                              () => SizedBox(
                                height: 50,
                                child: OutlinedButton(
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : _handleAppleLogin,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: BorderSide(color: Colors.grey[300]!),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(FontAwesomeIcons.apple, size: 20),
                                      const SizedBox(width: 10),
                                      const Text(
                                        '使用 Apple 账号登录',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          // Apple 登录不可用提示
                          if ((Platform.isIOS || Platform.isMacOS) &&
                              !_isAppleSignInAvailable)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.info_circle,
                                    color: Colors.orange[700],
                                    size: 20,
                                  ),
                                  const Gap(8),
                                  Expanded(
                                    child: Text(
                                      'Apple 登录不可用\n请在 Xcode 中配置 Sign in with Apple',
                                      style: TextStyle(
                                        color: Colors.orange[700],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          // 提示文字（非 Apple 平台）
                          if (!Platform.isIOS && !Platform.isMacOS)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.info_circle,
                                    color: Colors.blue[700],
                                    size: 20,
                                  ),
                                  const Gap(8),
                                  Expanded(
                                    child: Text(
                                      'Apple 登录仅支持 iOS/macOS',
                                      style: TextStyle(
                                        color: Colors.blue[700],
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.3),

                  const Gap(24),

                  // 提示信息
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '💡 测试账号',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          '邮箱：任意邮箱格式\n密码：至少 6 位',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
