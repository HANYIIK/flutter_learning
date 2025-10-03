# Flutter 教学项目 🚀

一个完整的 Flutter 入门教学项目，展示了 Flutter 开发的各种核心概念和最佳实践。采用现代化的底部导航设计，让学习体验更加流畅。

> 📖 **[点击查看完整教学指南 →](docs/FLUTTER_GUIDE.md)**  
> 专为有 React、Vue、uniapp 基础的全栈开发者准备！

## ✨ 项目特色

- 🎨 **现代化 UI 设计**：使用 Material Design 3 和 Google Fonts
- 🎯 **最佳 Icon 库**：集成 Iconsax、FontAwesome 和 Lucide Icons
- 💫 **精美动画效果**：使用 flutter_animate 和 animated_text_kit
- 📱 **底部导航栏**：采用 TabBar 设计，快速切换学习模块
- 🚀 **GetX 全家桶**：最火的状态管理 + 路由解决方案
- 📱 **响应式适配**：使用 flutter_screenutil 适配不同屏幕
- 📦 **模块化教学**：分为 4 个主要学习模块 + 7 个详情页面

## 📚 学习模块

应用采用底部 TabBar 导航，点击即可快速切换到不同的学习模块：

### 1️⃣ 基础组件 (蓝紫色 Tab)
学习 Flutter 的基本 Widget，包括：
- 🔘 各种按钮样式（Elevated、Filled、Outlined、Text Button）
- 📝 文本样式和排版
- 🎨 Icon 图标的使用（Iconsax + FontAwesome）
- 🎛️ 交互组件（计数器、开关、滑块）
- 📦 容器和布局（渐变、阴影等）

### 2️⃣ 动画效果 (粉红色 Tab)
探索 Flutter 的动画系统：
- ⚡ Flutter Animate 动画库（淡入、滑动、缩放）
- 💬 文字动画效果（打字机、淡入淡出、波浪）
- ✨ Shimmer 加载动画
- 🔄 交互式动画（可展开容器）
- 🎯 旋转和过渡效果

### 3️⃣ 表单与输入 (绿色 Tab)
掌握用户输入处理：
- ⌨️ 文本输入和实时验证
- 🔘 单选按钮和复选框
- 📊 滑块和评分组件
- 📋 下拉菜单选择器
- 📅 日期和时间选择器
- ✅ 完整的表单验证和提交流程

### 4️⃣ 列表与网格 (橙色 Tab)
学习数据展示（包含内部 Tab 导航）：
- 📜 基础 ListView 和可展开列表
- 🎴 卡片式列表（带操作按钮）
- 🔲 网格布局（GridView）
- 🎯 多样化的数据展示方式

## 🛠️ 使用的组件库

### 🎯 核心框架
- **GetX** (^4.6.6) - 状态管理 + 路由 + 依赖注入三合一
- **flutter_screenutil** (^5.9.0) - 响应式屏幕适配

### 🎨 Icon 库
- **Iconsax** (^0.0.8) - 现代化、美观的图标库
- **FontAwesome** (^10.7.0) - 流行的 FontAwesome 图标
- **Lucide Icons** (^1.0.0) - 你熟悉的 Lucide 图标（Web 同款）

### 🌈 动画库
- **flutter_animate** (^4.5.0) - 强大的动画库
- **animated_text_kit** (^4.2.2) - 文字动画效果
- **shimmer** (^3.0.0) - 加载动画效果

### 🔧 其他工具
- **google_fonts** (^6.2.1) - Google 字体库
- **gap** (^3.0.1) - 简化间距的 widget

## 🚀 运行项目

1. 确保已安装 Flutter SDK
2. 克隆或下载本项目
3. 运行以下命令安装依赖：
   ```bash
   flutter pub get
   ```
4. 启动模拟器或连接真机
5. 运行项目：
   ```bash
   flutter run
   ```

## 📱 支持的平台

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 💡 学习建议

### 📚 **对于有 Web 开发经验的你：**

**强烈建议先阅读：[📖 Flutter 入门指南](docs/FLUTTER_GUIDE.md)**

这份指南详细讲解了：
- ✅ Flutter vs HTML/CSS/JS 的核心区别
- ✅ Widget 树 vs Virtual DOM
- ✅ GetX vs React Hooks/Vue Composition API
- ✅ 链式编程详解
- ✅ 动画系统对比（flutter_animate vs Framer Motion）
- ✅ 完整的代码对比示例

### 推荐学习路径：
1. **基础组件** 🟦 - 从底部第一个 Tab 开始，了解 Flutter 的基本构建块
   - 对应 Web：学习 HTML 标签 → 学习 Flutter Widget
   - 重点：理解 Widget 嵌套思维

2. **动画效果** 🟪 - 点击底部第二个 Tab，让你的应用更生动
   - 对应 Web：CSS Animations → flutter_animate 链式 API
   - 重点：链式编程 `.animate().fadeIn().slideX()`

3. **表单与输入** 🟩 - 点击底部第三个 Tab，学习用户交互和数据验证
   - 对应 Web：shadcn/ui 表单 → 现代化 Flutter 表单
   - 重点：现代化设计风格（渐变、阴影、动画）

4. **列表与网格** 🟧 - 点击底部第四个 Tab，掌握各种数据展示方式
   - 对应 Web：列表渲染 → ListView/GridView
   - 重点：点击卡片跳转详情（GetX 路由）

5. **状态管理和路由** 🚀 - 点击"GetX 路由跳转"区域
   - 对应 Web：React Hooks/Vue Composition → GetX
   - 重点：`.obs` 响应式变量、`Get.toNamed()` 路由

### 使用技巧：
- 📱 **底部导航**：点击底部的任意 Tab 即可切换模块
- 🎯 **状态保持**：切换 Tab 不会丢失当前页面的状态（IndexedStack）
- 💾 **独立学习**：每个模块都可以独立学习，互不影响
- 🎨 **颜色识别**：每个 Tab 都有独特的主题色，方便识别
- 🔗 **路由跳转**：在"基础组件"和"列表与网格"中体验页面跳转

## 📖 学习资源

### **本项目文档：**
- 📘 **[Flutter 入门指南](docs/FLUTTER_GUIDE.md)** - 从 Web 到 Flutter（必读）
- 📗 [技术选型说明](docs/技术选型.md) - 为什么选这些技术栈

### **官方文档：**
- [Flutter 官方文档](https://flutter.dev/docs)
- [Dart 语言指南](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)
- [GetX 官方文档](https://pub.dev/packages/get)

### **图标库：**
- [Iconsax 图标预览](https://iconsax-flutter.vercel.app/)
- [FontAwesome 图标搜索](https://fontawesome.com/search)
- [Lucide Icons](https://lucide.dev/icons/)

## 🎯 项目目标

通过这个教学项目，你将学会：
- ✅ Flutter 的基本概念和架构
- ✅ Widget 的使用和组合
- ✅ 底部导航栏的实现（BottomNavigationBar）
- ✅ **GetX 状态管理**（简单、复杂、全局状态）
- ✅ **GetX 路由管理**（页面跳转、参数传递、命名路由）
- ✅ 动画和过渡效果
- ✅ 表单处理和验证
- ✅ 列表和网格布局
- ✅ 响应式屏幕适配
- ✅ Material Design 3 设计规范

## 🏗️ 项目结构

```
lib/
├── main.dart                          # 应用入口（GetX + ScreenUtil 初始化）
├── routes/
│   ├── app_routes.dart               # 路由名称常量
│   └── app_pages.dart                # 路由配置
├── controllers/                       # GetX 控制器（状态管理）
│   ├── counter_controller.dart       # 计数器控制器
│   ├── cart_controller.dart          # 购物车控制器
│   └── user_controller.dart          # 用户信息控制器
├── screens/
│   ├── home_screen.dart              # 主页面（底部导航容器）
│   ├── basic_widgets_screen.dart     # Tab 1: 基础组件教学
│   ├── animations_screen.dart        # Tab 2: 动画效果教学
│   ├── forms_screen.dart             # Tab 3: 表单与输入教学
│   ├── lists_screen.dart             # Tab 4: 列表与网格教学
│   └── details/                      # 详情页面（演示路由）
│       ├── product_detail_screen.dart    # 产品详情
│       ├── user_profile_screen.dart      # 用户资料
│       ├── settings_screen.dart          # 设置页面
│       ├── about_screen.dart             # 关于页面
│       ├── counter_demo_screen.dart      # 计数器演示
│       └── cart_demo_screen.dart         # 购物车演示
```

## 🎨 设计特点

- **底部导航栏**：现代化的 Tab 设计，每个 Tab 有独特的颜色标识
- **彩色背景高亮**：选中的 Tab 会显示半透明的彩色背景
- **流畅动画**：Tab 切换时有轻微的缩放动画效果
- **状态保持**：使用 IndexedStack 保持每个页面的状态
- **GetX 路由**：页面跳转动画流畅，支持参数传递
- **响应式适配**：自动适配不同屏幕尺寸
- **Material Design 3**：遵循最新的 Material 设计规范

## 🚀 GetX 功能演示

### 状态管理示例：
1. **计数器演示** - 简单的响应式状态（`.obs`）
   - 📁 文件：`controllers/counter_controller.dart`
   - 🎯 对应 React: `useState`, Vue: `ref()`

2. **购物车演示** - 复杂的列表状态管理
   - 📁 文件：`controllers/cart_controller.dart`
   - 🎯 对应：Zustand store, Pinia store

3. **用户资料** - 全局状态共享
   - 📁 文件：`controllers/user_controller.dart`
   - 🎯 对应：React Context, Vue provide/inject

### 路由跳转示例：
1. **基础跳转** - `Get.toNamed('/page')`
   - 📁 使用：`basic_widgets_screen.dart` 第 281 行
   - 🎯 对应：`navigate('/page')`, `router.push('/page')`

2. **参数传递** - `Get.toNamed('/detail', arguments: data)`
   - 📁 使用：`lists_screen.dart` 第 246 行
   - 🎯 对应：`navigate('/detail', { state: data })`

3. **返回跳转** - `Get.back()`
   - 🎯 对应：`navigate(-1)`, `router.back()`

4. **页面过渡** - 多种过渡动画效果
   - 📁 配置：`routes/app_pages.dart`
   - 🎯 对应：Framer Motion 页面过渡

### 在哪里体验？
- 📱 **基础组件** Tab：底部有"GetX 路由跳转"演示区（3 个跳转按钮）
- 📱 **列表与网格** Tab：点击任意产品卡片查看详情（参数传递）
- 📱 详情页面有完整的购物车、用户资料等功能

---

## 🎨 代码风格：现代化设计

### **shadcn/ui 风格的 Flutter 实现**

本项目的表单页面（`forms_screen.dart`）参考了 shadcn/ui 的设计理念：

- ✅ **微妙阴影** - `BoxShadow` 增加深度感
- ✅ **渐变背景** - `LinearGradient` 增加视觉吸引力
- ✅ **聚焦状态** - `focusedBorder` 明确交互反馈
- ✅ **圆角统一** - 14-16px 统一圆角设计
- ✅ **渐入动画** - `.animate().fadeIn()` 流畅过渡
- ✅ **响应式交互** - InkWell 水波纹效果

### **链式编程示例**

```dart
// 链式动画（forms_screen.dart）
_buildModernTextField(...)
  .animate()
  .fadeIn(delay: 100.ms)      // 100ms 后淡入
  .slideX(begin: -0.1)         // 从左滑入

// 链式时间（Duration 扩展）
Duration(milliseconds: 500)  →  500.ms
Duration(seconds: 2)         →  2.seconds
```

---

## 🎓 Web 开发者的 Flutter 速查表

### **React → Flutter 映射表**

```javascript
// React
const [count, setCount] = useState(0);
setCount(count + 1);
{count}

// Flutter GetX
var count = 0.obs;
count++;
Obx(() => Text('${count}'))
```

```javascript
// React Router
navigate('/detail', { state: { id: 1 } })

// Flutter GetX
Get.toNamed('/detail', arguments: { 'id': 1 })
```

```jsx
// React + Framer Motion
<motion.div animate={{ opacity: 1 }}>

// Flutter + flutter_animate
Container(...).animate().fadeIn()
```

### **Vue → Flutter 映射表**

```javascript
// Vue Composition API
const count = ref(0);
count.value++;

// Flutter GetX
var count = 0.obs;
count++;  // 完全一样！
```

```javascript
// Vue Router
router.push({ name: 'detail', params: { id: 1 } })

// Flutter GetX
Get.toNamed('/detail', arguments: { 'id': 1 })
```

---

祝你学习愉快！💪

📘 **记得阅读：[Flutter 入门指南](docs/FLUTTER_GUIDE.md)** - 专为 Web 开发者准备的深度教程！

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
