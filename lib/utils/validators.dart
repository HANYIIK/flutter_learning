/// 表单验证工具类
/// 提供常用的表单验证方法
class Validators {
  // 私有构造函数，防止实例化
  Validators._();

  /// 验证是否为空
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? '此字段'}不能为空';
    }
    return null;
  }

  /// 验证邮箱格式
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '邮箱不能为空';
    }

    // 正则表达式验证邮箱
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return '邮箱格式不正确';
    }

    return null;
  }

  /// 验证密码（最少6位）
  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return '密码不能为空';
    }

    if (value.length < minLength) {
      return '密码长度不能少于$minLength位';
    }

    return null;
  }

  /// 验证强密码（包含大小写字母、数字）
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '密码不能为空';
    }

    if (value.length < 8) {
      return '密码长度不能少于8位';
    }

    // 至少包含一个小写字母
    if (!value.contains(RegExp(r'[a-z]'))) {
      return '密码必须包含小写字母';
    }

    // 至少包含一个大写字母
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '密码必须包含大写字母';
    }

    // 至少包含一个数字
    if (!value.contains(RegExp(r'[0-9]'))) {
      return '密码必须包含数字';
    }

    return null;
  }

  /// 验证手机号（中国大陆）
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return '手机号不能为空';
    }

    // 正则表达式验证手机号（1开头，11位数字）
    final phoneRegex = RegExp(r'^1[3-9]\d{9}$');

    if (!phoneRegex.hasMatch(value)) {
      return '手机号格式不正确';
    }

    return null;
  }

  /// 验证最小长度
  static String? minLength(String? value, int min, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? '此字段'}不能为空';
    }

    if (value.length < min) {
      return '${fieldName ?? '此字段'}长度不能少于$min位';
    }

    return null;
  }

  /// 验证最大长度
  static String? maxLength(String? value, int max, {String? fieldName}) {
    if (value != null && value.length > max) {
      return '${fieldName ?? '此字段'}长度不能超过$max位';
    }

    return null;
  }

  /// 验证数字
  static String? number(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? '此字段'}不能为空';
    }

    if (double.tryParse(value) == null) {
      return '${fieldName ?? '此字段'}必须是数字';
    }

    return null;
  }

  /// 验证整数
  static String? integer(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? '此字段'}不能为空';
    }

    if (int.tryParse(value) == null) {
      return '${fieldName ?? '此字段'}必须是整数';
    }

    return null;
  }

  /// 验证数值范围
  static String? range(
    String? value,
    double min,
    double max, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? '此字段'}不能为空';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return '${fieldName ?? '此字段'}必须是数字';
    }

    if (number < min || number > max) {
      return '${fieldName ?? '此字段'}必须在$min到$max之间';
    }

    return null;
  }

  /// 验证两次密码是否一致
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return '确认密码不能为空';
    }

    if (value != password) {
      return '两次密码输入不一致';
    }

    return null;
  }

  /// 验证身份证号（中国大陆）
  static String? idCard(String? value) {
    if (value == null || value.isEmpty) {
      return '身份证号不能为空';
    }

    // 正则表达式验证身份证号（15位或18位）
    final idCardRegex = RegExp(r'^\d{15}$|^\d{17}[\dXx]$');

    if (!idCardRegex.hasMatch(value)) {
      return '身份证号格式不正确';
    }

    return null;
  }

  /// 验证 URL
  static String? url(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL 不能为空';
    }

    // 正则表达式验证 URL
    final urlRegex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'URL 格式不正确';
    }

    return null;
  }

  /// 组合多个验证器
  static String? combine(
    String? value,
    List<String? Function(String?)> validators,
  ) {
    for (final validator in validators) {
      final error = validator(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
