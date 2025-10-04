# Flutter 开发命令速查手册 📖

> Makefile 快捷命令 + Dart/Flutter 原生命令对照表

---

## 🚀 快速开始

本项目提供了 **Makefile** 来简化常用命令，同时也列出了等价的原生命令。

### **推荐使用 Makefile：**
```bash
make format    # 格式化代码
make lint      # 代码检查
make test      # 运行测试
make run       # 运行项目
```

### **或使用原生命令：**
```bash
dart format lib test
flutter analyze
flutter test
flutter run
```

---

## 📋 完整命令对照表

| Makefile 命令 | 等价的原生命令 | 作用 | 类比 npm |
|--------------|--------------|------|---------|
| `make format` | `dart format lib test` | 格式化代码 | `npm run format` |
| `make clean` | `flutter clean` | 清理构建产物 | `npm run clean` |
| `make install` | `flutter pub get` | 安装依赖 | `npm install` |
| `make run` | `flutter run` | 运行项目 | `npm run dev` |
| `make lint` | `flutter analyze` | 代码检查 | `npm run lint` |
| `make test` | `flutter test` | 运行测试 | `npm test` |
| `make check` | `dart format lib test && flutter analyze && flutter test` | 完整检查 | `npm run ci` |
| `make build-ios` | `flutter build ios` | 构建 iOS | `npm run build:ios` |
| `make build-web` | `flutter build web` | 构建 Web | `npm run build` |

---

## 📚 详细命令说明

### **1. 代码格式化 (format)**

#### **Makefile 命令：**
```bash
make format
```

#### **等价原生命令：**
```bash
dart format lib test
```

#### **详细说明：**
- 🎨 自动格式化 `lib/` 和 `test/` 目录下的所有代码
- 🎨 调整缩进、换行、空格
- 🎨 统一代码风格（遵循 Dart 官方规范）
- 🎨 修改会直接保存到文件

#### **其他用法：**
```bash
# 只格式化 lib 目录
dart format lib

# 只查看需要改动的内容（不实际修改）
dart format --output=show lib

# 检查代码是否符合格式规范
dart format --set-exit-if-changed lib

# 格式化指定文件
dart format lib/main.dart
```

#### **输出示例：**
```
Formatted lib/main.dart
Formatted lib/screens/home_screen.dart
Formatted lib/controllers/cart_controller.dart
Formatted 15 files (3 changed) in 0.8 seconds.
```

---

### **2. 清理项目 (clean)**

#### **Makefile 命令：**
```bash
make clean
```

#### **等价原生命令：**
```bash
flutter clean
```

#### **作用：**
- 🧹 删除 `build/` 目录（构建产物）
- 🧹 删除 `.dart_tool/` 目录（工具缓存）
- 🧹 删除 iOS/Android 的构建缓存
- 🧹 释放磁盘空间

#### **什么时候用？**
- ✅ 遇到奇怪的编译错误
- ✅ 切换分支后
- ✅ 依赖包更新后
- ✅ 项目运行异常时

#### **注意：**
- ⚠️ 清理后需要重新运行 `flutter pub get`
- ⚠️ iOS 需要重新 `pod install`

#### **完整清理流程：**
```bash
make clean
make install
# 或
flutter clean && flutter pub get && cd ios && pod install && cd ..
```

---

### **3. 安装依赖 (install)**

#### **Makefile 命令：**
```bash
make install
```

#### **等价原生命令：**
```bash
flutter pub get
```

#### **作用：**
- 📦 读取 `pubspec.yaml` 中的依赖
- 📦 下载并安装所有包
- 📦 生成 `pubspec.lock` 文件
- 📦 更新 `.dart_tool/` 缓存

#### **类比 npm：**
```bash
npm install          # Web
flutter pub get      # Flutter
```

#### **其他依赖命令：**
```bash
# 更新所有依赖到最新版本
flutter pub upgrade

# 查看过时的依赖
flutter pub outdated

# 添加新依赖
flutter pub add get

# 移除依赖
flutter pub remove provider

# 安装并更新依赖
flutter pub get --offline  # 离线模式
```

---

### **4. 运行项目 (run)**

#### **Makefile 命令：**
```bash
make run
```

#### **等价原生命令：**
```bash
flutter run
```

#### **作用：**
- 🚀 编译并运行 Flutter 应用
- 🚀 自动选择可用设备
- 🚀 启用热重载（Hot Reload）
- 🚀 启用热重启（Hot Restart）

#### **指定设备运行：**
```bash
# 查看所有设备
flutter devices

# iOS 模拟器
flutter run -d 'iPhone 16e'

# iOS 真机
flutter run -d 'bello的iPhone'

# Android 模拟器
flutter run -d emulator-5554

# Chrome 浏览器
flutter run -d chrome

# macOS 桌面
flutter run -d macos
```

#### **运行模式：**
```bash
# Debug 模式（默认，带调试信息）
flutter run

# Release 模式（性能优化，无调试）
flutter run --release

# Profile 模式（性能分析）
flutter run --profile
```

#### **运行中的快捷键：**
```
r    热重载（Hot Reload）🔥
R    热重启（Hot Restart）
p    显示网格线（调试布局）
o    切换平台（iOS/Android）
q    退出应用
h    显示帮助
```

---

### **5. 代码检查 (lint)**

#### **Makefile 命令：**
```bash
make lint
```

#### **等价原生命令：**
```bash
flutter analyze
```

#### **作用：**
- 🔍 静态代码分析
- 🔍 检查潜在错误
- 🔍 检查代码规范
- 🔍 检查未使用的导入

#### **检查规则配置：**
```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    - prefer_const_constructors
    - avoid_print
    - prefer_single_quotes
```

#### **输出示例：**
```
Analyzing my_first_ios_app...

  info • Unused import • lib/main.dart:5 • unused_import
  warning • Missing return type • lib/utils/helper.dart:10

2 issues found.
```

#### **只检查错误（忽略警告）：**
```bash
flutter analyze --fatal-infos
```

---

### **6. 运行测试 (test)**

#### **Makefile 命令：**
```bash
make test
```

#### **等价原生命令：**
```bash
flutter test
```

#### **作用：**
- 🧪 运行 `test/` 目录下的所有测试
- 🧪 验证代码正确性
- 🧪 生成测试报告

#### **测试相关命令：**
```bash
# 运行所有测试
flutter test

# 运行指定测试文件
flutter test test/widget_test.dart

# 生成覆盖率报告
flutter test --coverage

# 查看覆盖率报告（需要安装 lcov）
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

#### **我们项目的测试：**
```dart
// test/widget_test.dart
testWidgets('Flutter 教学项目加载测试', (WidgetTester tester) async {
  await tester.pumpWidget(const MyFlutterLearningApp());
  expect(find.text('Flutter 教学项目'), findsOneWidget);
});
```

---

### **7. 完整检查 (check)**

#### **Makefile 命令：**
```bash
make check
```

#### **等价原生命令：**
```bash
dart format lib test && flutter analyze && flutter test
```

#### **作用：**
- ✅ 格式化代码
- ✅ 代码静态分析
- ✅ 运行所有测试
- ✅ 确保代码质量

#### **什么时候用？**
- 📝 提交代码前
- 📝 Pull Request 前
- 📝 发布版本前
- 📝 CI/CD 流程中

#### **输出示例：**
```
🎨 格式化代码...
Formatted 15 files (0 changed)

🔍 检查代码...
Analyzing my_first_ios_app...
No issues found!

🧪 运行测试...
00:01 +1: All tests passed!

✅ 检查完成！
```

---

### **8. 构建 iOS (build-ios)**

#### **Makefile 命令：**
```bash
make build-ios
```

#### **等价原生命令：**
```bash
flutter build ios
```

#### **作用：**
- 📱 构建 iOS 应用
- 📱 生成 .app 文件
- 📱 准备上架 App Store

#### **详细构建命令：**
```bash
# Release 构建（默认）
flutter build ios

# 不签名构建（测试用）
flutter build ios --no-codesign

# 指定构建模式
flutter build ios --debug
flutter build ios --profile
flutter build ios --release

# 构建 IPA（上架用）
flutter build ipa
```

#### **构建产物位置：**
```
build/ios/iphoneos/Runner.app
```

---

### **9. 构建 Web (build-web)**

#### **Makefile 命令：**
```bash
make build-web
```

#### **等价原生命令：**
```bash
flutter build web
```

#### **作用：**
- 🌐 构建 Web 应用
- 🌐 生成可部署的静态文件
- 🌐 可以部署到任何静态托管服务

#### **详细构建命令：**
```bash
# 普通构建
flutter build web

# 指定基础路径（部署到子目录）
flutter build web --base-href /my-app/

# CanvasKit 渲染器（性能更好）
flutter build web --web-renderer canvaskit

# HTML 渲染器（兼容性更好）
flutter build web --web-renderer html
```

#### **构建产物位置：**
```
build/web/
├── index.html
├── main.dart.js
├── flutter.js
└── assets/
```

#### **部署示例：**
```bash
# 构建
make build-web

# 部署到 Netlify/Vercel（直接拖拽 build/web 文件夹）

# 或使用 Firebase Hosting
firebase deploy --only hosting

# 或本地预览
cd build/web && python3 -m http.server 8000
```

---

## 🎯 开发工作流推荐

### **每日开发流程：**

```bash
# 1. 早上开始工作
make install         # 更新依赖（如果有人更新了 pubspec.yaml）

# 2. 启动开发
make run            # 或 flutter run

# 3. 开发中...
# 修改代码 → 保存 → 自动热重载 🔥

# 4. 提交代码前
make format         # 格式化代码
make lint           # 检查错误

# 5. 提交
git add .
git commit -m "feat: 添加新功能"
```

### **完整检查流程：**

```bash
# 一键完成所有检查
make check

# 等价于
make format && make lint && make test

# 等价于原生命令
dart format lib test && flutter analyze && flutter test
```

---

## 🆚 与 npm/yarn 命令对比

### **Web 开发者速查表：**

| 你熟悉的 npm 命令 | Flutter 等价命令 | Makefile 快捷方式 |
|-----------------|-----------------|------------------|
| `npm install` | `flutter pub get` | `make install` |
| `npm run format` | `dart format .` | `make format` |
| `npm run lint` | `flutter analyze` | `make lint` |
| `npm test` | `flutter test` | `make test` |
| `npm run dev` | `flutter run` | `make run` |
| `npm run build` | `flutter build web` | `make build-web` |
| `npm run clean` | `flutter clean` | `make clean` |
| `npm run check` | `make check` | `make check` |
| `npm outdated` | `flutter pub outdated` | - |
| `npm update` | `flutter pub upgrade` | - |

---

## 🔧 高级命令

### **依赖管理：**

```bash
# 安装依赖
flutter pub get

# 更新所有依赖到最新版本
flutter pub upgrade

# 查看过时的依赖
flutter pub outdated

# 添加新依赖（自动更新 pubspec.yaml）
flutter pub add iconsax
flutter pub add get --dev  # 添加到 dev_dependencies

# 移除依赖
flutter pub remove provider

# 查看依赖树
flutter pub deps

# 获取包的信息
flutter pub get --verbose
```

---

### **设备管理：**

```bash
# 查看所有连接的设备
flutter devices

# 输出示例：
# iPhone 16e (mobile)         • iPhone-16e       • ios
# Chrome (web)                • chrome           • web-javascript
# macOS (desktop)             • macos            • darwin-arm64

# 指定设备运行
flutter run -d chrome
flutter run -d 'iPhone 16e'
flutter run -d macos

# 列出所有模拟器
flutter emulators

# 启动模拟器
flutter emulators --launch apple_ios_simulator
```

---

### **构建命令：**

```bash
# iOS 构建
flutter build ios                    # 构建 .app
flutter build ios --release          # Release 模式
flutter build ios --no-codesign      # 不签名（测试）
flutter build ipa                    # 构建 .ipa（上架用）

# Android 构建
flutter build apk                    # 构建 APK
flutter build apk --split-per-abi    # 按架构分包（减小体积）
flutter build appbundle              # 构建 AAB（Google Play 上架）

# Web 构建
flutter build web                    # 构建 Web
flutter build web --release          # Release 模式
flutter build web --web-renderer canvaskit  # 使用 CanvasKit

# macOS 构建
flutter build macos

# Windows 构建
flutter build windows

# Linux 构建
flutter build linux
```

---

### **调试命令：**

```bash
# 启用性能分析
flutter run --profile

# 启用 Observatory（调试工具）
flutter run --observatory-port=8888

# 启用详细日志
flutter run --verbose

# 跟踪 Widget 重建
flutter run --trace-startup

# 查看应用大小分析
flutter build apk --analyze-size
```

---

### **代码质量命令：**

```bash
# 代码检查
flutter analyze

# 严格模式（把警告当错误）
flutter analyze --fatal-infos

# 生成诊断报告
flutter analyze --write=analysis.txt

# 修复可自动修复的问题
dart fix --apply

# 查看可修复的问题
dart fix --dry-run
```

---

## 💡 常用组合命令

### **新克隆项目后的初始化：**

```bash
# 方式 1：使用 Makefile
make clean && make install

# 方式 2：原生命令
flutter clean && flutter pub get && cd ios && pod install && cd ..
```

---

### **切换分支后：**

```bash
make clean && make install && make run
```

---

### **提交代码前的完整检查：**

```bash
# 方式 1：一键检查
make check

# 方式 2：分步执行
make format    # 格式化
make lint      # 检查错误
make test      # 运行测试

# 方式 3：原生命令
dart format lib test
flutter analyze
flutter test
```

---

### **发布前的完整流程：**

```bash
# 1. 清理项目
make clean

# 2. 安装依赖
make install

# 3. 完整检查
make check

# 4. 构建发布版本
make build-ios     # iOS
make build-web     # Web

# 或原生命令
flutter build ios --release
flutter build web --release
```

---

## 📱 平台特定命令

### **iOS 开发：**

```bash
# 安装 CocoaPods 依赖（iOS 必需）
cd ios && pod install && cd ..

# 打开 Xcode 项目
open ios/Runner.xcworkspace

# 清理 iOS 缓存
cd ios && rm -rf Pods Podfile.lock && pod install && cd ..

# 查看 iOS 设备日志
flutter logs
```

---

### **Android 开发：**

```bash
# 构建 APK
flutter build apk

# 构建 App Bundle（Google Play）
flutter build appbundle

# 列出 Android 设备
adb devices

# 安装 APK 到设备
flutter install

# 查看 Android 日志
flutter logs
```

---

### **Web 开发：**

```bash
# 运行 Web 版本
flutter run -d chrome

# 构建 Web
flutter build web

# 指定端口运行
flutter run -d chrome --web-port=8080

# 本地预览构建结果
cd build/web && python3 -m http.server 8000

# 或使用 serve
npx serve build/web
```

---

## 🎨 代码格式化详解

### **Dart Format 规则：**

```bash
# 格式化所有文件
dart format .

# 格式化指定目录
dart format lib
dart format lib test

# 只检查不修改
dart format --output=show lib

# 输出需要改动的文件列表
dart format --output=none --show=changed lib

# 设置行宽（默认 80）
dart format --line-length=120 lib
```

---

### **格式化示例：**

#### **格式化前：**
```dart
final List<Map<String,dynamic>>items=[{'name':'iPhone','price':8999},{'name':'iPad','price':4799}];
```

#### **格式化后：**
```dart
final List<Map<String, dynamic>> items = [
  {'name': 'iPhone', 'price': 8999},
  {'name': 'iPad', 'price': 4799}
];
```

---

## 🔍 代码分析详解

### **Flutter Analyze 功能：**

```bash
# 基础分析
flutter analyze

# 显示所有问题（包括 info）
flutter analyze --verbose

# 把警告当作错误
flutter analyze --fatal-warnings

# 只显示错误
flutter analyze | grep error
```

---

### **分析结果说明：**

```
✅ No issues found!              # 完美！
⚠️  warning • 警告信息           # 建议修复
❌ error • 错误信息              # 必须修复
ℹ️  info • 提示信息              # 可选优化
```

---

## 🧪 测试命令详解

### **测试相关命令：**

```bash
# 运行所有测试
flutter test

# 运行指定文件
flutter test test/widget_test.dart

# 运行包含特定名称的测试
flutter test --name="counter"

# 生成覆盖率
flutter test --coverage

# 并发运行（加速）
flutter test --concurrency=4

# 更新 golden 文件（UI 测试）
flutter test --update-goldens
```

---

### **测试覆盖率：**

```bash
# 1. 生成覆盖率数据
flutter test --coverage

# 2. 生成 HTML 报告（需要 lcov）
# macOS 安装 lcov
brew install lcov

# 生成报告
genhtml coverage/lcov.info -o coverage/html

# 3. 查看报告
open coverage/html/index.html
```

---

## 🎯 实用技巧

### **1. 创建别名（更快）：**

在 `~/.zshrc` 或 `~/.bashrc` 中添加：

```bash
# Flutter 别名
alias fr="flutter run"
alias fc="flutter clean"
alias fp="flutter pub get"
alias fa="flutter analyze"
alias ft="flutter test"
alias ff="dart format lib"
```

保存后：
```bash
source ~/.zshrc

# 现在可以用
fr      # flutter run
fc      # flutter clean
ff      # dart format lib
```

---

### **2. VS Code 任务配置：**

创建 `.vscode/tasks.json`：

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Flutter: Format",
      "type": "shell",
      "command": "dart format lib test",
      "group": "build"
    },
    {
      "label": "Flutter: Analyze",
      "type": "shell",
      "command": "flutter analyze",
      "group": "test"
    },
    {
      "label": "Flutter: Clean & Get",
      "type": "shell",
      "command": "flutter clean && flutter pub get",
      "group": "build"
    }
  ]
}
```

使用：`Cmd+Shift+P` → `Tasks: Run Task`

---

### **3. Git Hooks（自动化）：**

创建 `.git/hooks/pre-commit`：

```bash
#!/bin/bash
echo "🎨 格式化代码..."
dart format lib test

echo "🔍 检查代码..."
flutter analyze

if [ $? -ne 0 ]; then
  echo "❌ 代码检查失败！请修复后再提交"
  exit 1
fi

echo "✅ 检查通过！"
```

---

## 📚 常见场景命令

### **场景 1：刚克隆项目**

```bash
# 完整初始化
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter run
```

---

### **场景 2：更新了依赖**

```bash
# 重新安装
flutter clean
flutter pub get

# iOS 还需要
cd ios && pod install && cd ..
```

---

### **场景 3：遇到奇怪的错误**

```bash
# 完全清理并重建
make clean
make install
make run

# 或
flutter clean
flutter pub get
cd ios && pod deintegrate && pod install && cd ..
flutter run
```

---

### **场景 4：发布新版本**

```bash
# 1. 完整检查
make check

# 2. 更新版本号
# 编辑 pubspec.yaml: version: 1.0.0+1 → 1.1.0+2

# 3. 构建 iOS
make build-ios

# 4. 构建 Android
flutter build appbundle

# 5. 构建 Web
make build-web
```

---

## 🎓 命令记忆技巧

### **最常用的 5 个命令：**

```bash
1. flutter run       # 运行（最常用）
2. dart format lib   # 格式化（每天用）
3. flutter analyze   # 检查（提交前用）
4. flutter clean     # 清理（遇到问题用）
5. flutter pub get   # 安装（更新依赖用）
```

### **Makefile 版本（更简短）：**

```bash
1. make run         # 运行
2. make format      # 格式化
3. make lint        # 检查
4. make clean       # 清理
5. make install     # 安装
```

---

## 💡 专业技巧

### **组合命令（一行搞定）：**

```bash
# 清理并重新运行
make clean && make install && make run

# 格式化并检查
make format && make lint

# 完整检查并构建
make check && make build-ios

# 原生版本
flutter clean && flutter pub get && flutter run
dart format lib && flutter analyze
```

---

### **监听文件变化（自动格式化）：**

虽然没有官方工具，但你可以用 VS Code 的"保存时格式化"：

```json
// .vscode/settings.json
{
  "editor.formatOnSave": true,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.rulers": [80]
  }
}
```

---

## 🎯 快速参考卡片

### **日常开发：**
```bash
flutter run              # 运行
r                       # 热重载（运行中）
R                       # 热重启（运行中）
dart format lib         # 格式化
flutter analyze         # 检查
```

### **项目维护：**
```bash
flutter clean           # 清理
flutter pub get         # 安装
flutter pub upgrade     # 更新
flutter pub outdated    # 查看过时的包
```

### **质量保证：**
```bash
dart format lib test    # 格式化
flutter analyze         # 静态分析
flutter test           # 运行测试
flutter test --coverage # 覆盖率
```

### **构建发布：**
```bash
flutter build ios       # iOS
flutter build apk       # Android APK
flutter build appbundle # Android AAB
flutter build web       # Web
```

---

## 🎊 总结

### **推荐使用 Makefile：**
```bash
make format    # 简短、易记
make lint      # 团队统一
make check     # 一键完成
```

### **或使用原生命令：**
```bash
dart format lib test
flutter analyze
flutter test
```

### **两种方式都可以！选你喜欢的！**

---

## 📖 更多资源

- [Dart 命令行工具](https://dart.dev/tools/dart-tool)
- [Flutter 命令行工具](https://docs.flutter.dev/reference/flutter-cli)
- [Flutter 测试文档](https://docs.flutter.dev/testing)

---

**快速上手：**
```bash
make format    # 格式化代码
make run       # 运行项目
make check     # 提交前检查
```

就这么简单！🚀

