# 日志框架使用指南 📝

本项目使用 **logger** 包（Flutter 最流行的日志框架）进行日志记录。

---

## 📦 安装

已在 `pubspec.yaml` 中配置：
```yaml
logger: ^2.0.2  # 日志框架（美观、强大）
```

---

## 🎯 使用方法

### **导入日志工具**
```dart
import 'package:my_first_ios_app/utils/logger.dart';
```

### **4 种日志级别**

| 方法 | 级别 | 颜色 | 使用场景 |
|------|------|------|----------|
| `Log.d()` | Debug | 💙 蓝色 | 调试信息（开发阶段） |
| `Log.i()` | Info | 💚 绿色 | 一般信息（流程追踪） |
| `Log.w()` | Warning | 💛 黄色 | 警告信息（需要注意） |
| `Log.e()` | Error | ❤️ 红色 | 错误信息（异常处理） |

---

## 💡 实际使用示例

### **1. Debug 日志（调试信息）**
```dart
// 开发阶段的调试输出
Log.d('用户点击了按钮');
Log.d('当前路由: ${Get.currentRoute}');
Log.d('购物车商品数: ${cartController.items.length}');
```

**输出：**
```
💙 DEBUG │ 用户点击了按钮
💙 DEBUG │ 当前路由: /home
💙 DEBUG │ 购物车商品数: 3
```

---

### **2. Info 日志（一般信息）**
```dart
// 重要的流程信息
Log.i('用户登录成功');
Log.i('加载商品列表: 共 ${products.length} 件');
Log.i('深色模式已切换');
```

**输出：**
```
💚 INFO  │ 用户登录成功
💚 INFO  │ 加载商品列表: 共 8 件
💚 INFO  │ 深色模式已切换
```

---

### **3. Warning 日志（警告）**
```dart
// 需要注意但不影响运行的情况
Log.w('API 响应时间过长: 3000ms');
Log.w('用户未登录，使用游客模式');
Log.w('购物车已达上限');
```

**输出：**
```
💛 WARN  │ API 响应时间过长: 3000ms
💛 WARN  │ 用户未登录，使用游客模式
💛 WARN  │ 购物车已达上限
```

---

### **4. Error 日志（错误）**
```dart
// 捕获异常和错误
try {
  final user = await authService.signInWithApple();
  Log.i('登录成功: ${user.name}');
} catch (e, stackTrace) {
  Log.e('Apple 登录失败', e, stackTrace);
}

// 简单错误（不需要堆栈）
if (email.isEmpty) {
  Log.e('邮箱不能为空');
}
```

**输出：**
```
❤️ ERROR │ Apple 登录失败
         ├─ Exception: 配置错误
         └─ StackTrace:
            #0  AuthService.signInWithApple
            #1  AuthController.signInWithApple
            ...
```

---

## 🎨 输出效果对比

### **print() vs logger**

#### **print()（之前）：**
```
检查登录状态失败: Exception: Network error
用户登录成功
API 响应较慢
```
- ❌ 无颜色区分
- ❌ 无 emoji 标识
- ❌ 无时间戳
- ❌ 无级别区分

#### **logger（现在）：**
```
[00:01:23.456] 💙 DEBUG │ 用户点击了登录按钮
[00:01:24.789] 💚 INFO  │ 用户登录成功: Apple 用户
[00:01:25.123] 💛 WARN  │ Token 即将过期
[00:01:26.456] ❤️ ERROR │ 检查登录状态失败
                       ├─ Exception: Network error
                       └─ at AuthController.checkLoginStatus
```
- ✅ 彩色输出，一目了然
- ✅ Emoji 标识，快速识别
- ✅ 时间戳，精确到毫秒
- ✅ 级别分明，易于过滤

---

## 📋 项目中的实际使用

### **auth_controller.dart（已应用）**
```dart
import 'package:my_first_ios_app/utils/logger.dart';

// 错误日志
try {
  final loggedIn = await authService.isLoggedIn();
  // ...
} catch (e) {
  Log.e('检查登录状态失败', e);  // ← 已应用 ✅
}
```

---

## 🔧 高级配置

如果需要自定义配置，修改 `lib/utils/logger.dart`：

```dart
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,           // 显示 2 层调用栈
    errorMethodCount: 8,      // 错误时显示 8 层
    lineLength: 80,           // 每行 80 字符
    colors: true,             // 彩色输出
    printEmojis: true,        // 使用 emoji
    printTime: true,          // 显示时间
  ),
  level: Level.debug,         // 日志级别（debug/info/warning/error）
);
```

---

## 📊 对比其他日志框架

| 框架 | 优点 | 缺点 |
|------|------|------|
| **logger** ⭐ | 美观、易用、功能全 | 稍微大一点 |
| **log** | 轻量 | 功能较少 |
| **dart:developer log** | 原生，无依赖 | 不够美观 |
| **print()** | 最简单 | 生产环境不推荐 ❌ |

---

## ✅ 为什么选择 logger？

1. ✅ **美观的输出**（彩色 + Emoji）
2. ✅ **自动格式化**（对象、Map、List 都能打印）
3. ✅ **调用栈追踪**（错误时显示完整堆栈）
4. ✅ **生产环境友好**（可以轻松禁用）
5. ✅ **Flutter 社区最流行**（20k+ stars）

---

## 🎉 完成！

现在项目使用专业的日志框架，不会再有 linter 警告了！

**使用建议：**
- 🐛 开发时多用 `Log.d()` 调试
- 📝 关键流程用 `Log.i()` 记录
- ⚠️ 潜在问题用 `Log.w()` 警告
- 💥 异常捕获用 `Log.e()` 记录

试试运行项目，查看美观的日志输出！🚀
