import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'controllers/cart_controller.dart';
import 'controllers/user_controller.dart';

void main() {
  // 初始化全局控制器（永久存在，不会被销毁）
  Get.put(CartController(), permanent: true);
  Get.put(UserController(), permanent: true);
  
  runApp(const MyFlutterLearningApp());
}

class MyFlutterLearningApp extends StatelessWidget {
  const MyFlutterLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          initialRoute: AppRoutes.home,
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
