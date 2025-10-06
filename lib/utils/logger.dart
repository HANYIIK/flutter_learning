import 'package:logger/logger.dart';

/// 全局日志工具
/// 使用 logger 包，输出美观、功能强大
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // 不显示方法调用栈
    errorMethodCount: 5, // 错误时显示 5 层调用栈
    lineLength: 50, // 每行宽度
    colors: true, // 彩色输出
    printEmojis: true, // 使用 emoji
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // 时间格式
  ),
);

/// 简化的日志工具类
class Log {
  Log._();

  /// Debug 日志（调试信息）
  static void d(dynamic message) => logger.d(message);

  /// Info 日志（一般信息）
  static void i(dynamic message) => logger.i(message);

  /// Warning 日志（警告）
  static void w(dynamic message) => logger.w(message);

  /// Error 日志（错误）
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }
}
