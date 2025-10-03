import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyFlutterLearningApp());
}

class MyFlutterLearningApp extends StatelessWidget {
  const MyFlutterLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 教学项目',
      debugShowCheckedModeBanner: false,
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
      home: const HomeScreen(),
    );
  }
}
