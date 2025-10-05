import 'package:intl/intl.dart';

/// 格式化工具类
/// 提供常用的数据格式化方法
class Formatters {
  // 私有构造函数，防止实例化
  Formatters._();

  /// 格式化金额（保留2位小数，添加千分位）
  static String currency(double amount, {String symbol = '¥'}) {
    final formatter = NumberFormat('#,##0.00', 'zh_CN');
    return '$symbol${formatter.format(amount)}';
  }

  /// 格式化金额（不带货币符号）
  static String currencyWithoutSymbol(double amount) {
    final formatter = NumberFormat('#,##0.00', 'zh_CN');
    return formatter.format(amount);
  }

  /// 格式化日期（yyyy-MM-dd）
  static String date(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// 格式化时间（HH:mm:ss）
  static String time(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  /// 格式化日期时间（yyyy-MM-dd HH:mm:ss）
  static String dateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  /// 格式化日期时间（中文格式）
  static String dateTimeChinese(DateTime dateTime) {
    return DateFormat('yyyy年MM月dd日 HH:mm').format(dateTime);
  }

  /// 格式化相对时间（刚刚、几分钟前、几小时前、几天前）
  static String relativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '刚刚';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks周前';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months个月前';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years年前';
    }
  }

  /// 格式化文件大小（B、KB、MB、GB）
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }

  /// 格式化数字（添加千分位）
  static String number(num number) {
    final formatter = NumberFormat('#,###', 'zh_CN');
    return formatter.format(number);
  }

  /// 格式化百分比
  static String percentage(double value, {int decimals = 1}) {
    return '${(value * 100).toStringAsFixed(decimals)}%';
  }

  /// 格式化手机号（隐藏中间4位）
  static String phoneWithMask(String phone) {
    if (phone.length != 11) {
      return phone;
    }
    return '${phone.substring(0, 3)}****${phone.substring(7)}';
  }

  /// 格式化身份证号（隐藏中间部分）
  static String idCardWithMask(String idCard) {
    if (idCard.length < 8) {
      return idCard;
    }
    return '${idCard.substring(0, 4)}**********${idCard.substring(idCard.length - 4)}';
  }

  /// 格式化银行卡号（每4位一组）
  static String bankCard(String cardNumber) {
    if (cardNumber.length < 4) {
      return cardNumber;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cardNumber[i]);
    }
    return buffer.toString();
  }

  /// 截断文本（超出部分显示省略号）
  static String truncate(
    String text,
    int maxLength, {
    String ellipsis = '...',
  }) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}$ellipsis';
  }

  /// 首字母大写
  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  /// 驼峰命名转下划线命名
  static String camelToSnake(String text) {
    return text.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    );
  }

  /// 下划线命名转驼峰命名
  static String snakeToCamel(String text) {
    return text.replaceAllMapped(
      RegExp(r'_([a-z])'),
      (match) => match.group(1)!.toUpperCase(),
    );
  }
}
