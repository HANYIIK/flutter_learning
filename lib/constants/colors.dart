import 'package:flutter/material.dart';

/// 应用颜色常量
/// 统一管理应用中使用的颜色
class AppColors {
  // 私有构造函数，防止实例化
  AppColors._();

  // ============ 主题色 ============
  /// 主色调（蓝紫色）
  static const Color primary = Color(0xFF6366F1);

  /// 次要色（粉色）
  static const Color secondary = Color(0xFFEC4899);

  /// 强调色（绿色）
  static const Color accent = Color(0xFF10B981);

  /// 警告色（橙色）
  static const Color warning = Color(0xFFF59E0B);

  // ============ 功能色 ============
  /// 成功色
  static const Color success = Color(0xFF10B981);

  /// 错误色
  static const Color error = Color(0xFFEF4444);

  /// 信息色
  static const Color info = Color(0xFF3B82F6);

  // ============ 底部导航栏颜色 ============
  /// Tab 1 - 基础组件（蓝紫色）
  static const Color tab1 = Color(0xFF6366F1);

  /// Tab 2 - 动画效果（粉色）
  static const Color tab2 = Color(0xFFEC4899);

  /// Tab 3 - 表单输入（绿色）
  static const Color tab3 = Color(0xFF10B981);

  /// Tab 4 - 列表网格（橙色）
  static const Color tab4 = Color(0xFFF59E0B);

  // ============ 渐变色 ============
  /// 紫色渐变
  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
  );

  /// 粉色渐变
  static const LinearGradient pinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEC4899), Color(0xFFF472B6)],
  );

  /// 绿色渐变
  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF10B981), Color(0xFF34D399)],
  );

  /// 橙色渐变
  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
  );

  // ============ 中性色 ============
  /// 背景色
  static const Color background = Color(0xFFF9FAFB);

  /// 表面色（卡片背景）
  static const Color surface = Colors.white;

  /// 边框色
  static const Color border = Color(0xFFE5E7EB);

  /// 分割线色
  static const Color divider = Color(0xFFE5E7EB);

  // ============ 文字颜色 ============
  /// 主要文字（深色）
  static const Color textPrimary = Color(0xFF1F2937);

  /// 次要文字（中灰）
  static const Color textSecondary = Color(0xFF6B7280);

  /// 辅助文字（浅灰）
  static const Color textTertiary = Color(0xFF9CA3AF);

  /// 禁用文字
  static const Color textDisabled = Color(0xFFD1D5DB);

  // ============ 阴影颜色 ============
  /// 阴影色（半透明黑色）
  static Color shadow = Colors.black.withOpacity(0.1);

  /// 强阴影色
  static Color shadowStrong = Colors.black.withOpacity(0.2);
}
