import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_first_ios_app/routes/app_pages.dart';
import 'package:my_first_ios_app/routes/app_routes.dart';
import 'package:my_first_ios_app/controllers/auth_controller.dart';
import 'package:my_first_ios_app/controllers/cart_controller.dart';

void main() async {
  // 确保 Flutter 绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化全局控制器
  Get.put(CartController(), permanent: true);
  final authController = Get.put(AuthController(), permanent: true);

  // 等待认证状态检查完成
  await authController.checkLoginStatus();

  runApp(const MyFlutterLearningApp());
}

class MyFlutterLearningApp extends StatelessWidget {
  const MyFlutterLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    // 使用 ScreenUtil 包裹应用，实现响应式适配
    return ScreenUtilInit(
      // 设计稿尺寸（iPhone 14 Pro 标准）
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter 教学项目',
          debugShowCheckedModeBanner: false,

          // GetX 路由配置
          initialRoute: authController.isLoggedIn.value
              ? AppRoutes.home
              : AppRoutes.login,
          getPages: AppPages.routes,

          // 主题配置
          theme: ThemeData(
            // 使用 Material Design 3
            useMaterial3: true,
            // 设置主题色为现代化的蓝紫色
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.light,
            ),
            // 使用 Google Fonts 的 Poppins 字体
            textTheme: GoogleFonts.poppinsTextTheme(),
            // 卡片主题
            cardTheme: CardThemeData(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            // AppBar 主题
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // GetX 配置
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
