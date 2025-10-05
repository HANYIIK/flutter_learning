# 项目结构说明 📂

完整的 Flutter 项目目录结构，遵循最佳实践和业界标准。

---

## 📁 完整目录结构

```
lib/
├── main.dart                    ← 应用入口文件
│
├── screens/                     ← 页面级组件
│   ├── home_screen.dart
│   ├── basic_widgets_screen.dart
│   ├── animations_screen.dart
│   ├── forms_screen.dart
│   ├── lists_screen.dart
│   └── details/                 ← 详情页面子目录
│       ├── about_screen.dart
│       ├── cart_demo_screen.dart
│       ├── counter_demo_screen.dart
│       ├── product_detail_screen.dart
│       ├── settings_screen.dart
│       └── user_profile_screen.dart
│
├── widgets/                     ← 可复用组件
│   └── app_drawer.dart          ← 全局抽屉组件
│
├── controllers/                 ← 状态管理（GetX）
│   ├── auth_controller.dart     ← 认证状态（登录/用户/深色模式）
│   ├── cart_controller.dart     ← 购物车状态
│   └── counter_controller.dart  ← 计数器状态
│
├── models/                      ← 数据模型
│   ├── cart_item.dart           ← 购物车商品模型
│   ├── product.dart             ← 商品模型
│   └── user.dart                ← 用户模型
│
├── services/                    ← API 服务（模拟）
│   ├── api_service.dart         ← 基础 API 服务
│   ├── product_service.dart     ← 商品 API
│   └── user_service.dart        ← 用户 API
│
├── routes/                      ← 路由配置
│   ├── app_routes.dart          ← 路由常量
│   └── app_pages.dart           ← 路由映射
│
├── constants/                   ← 常量配置
│   ├── colors.dart              ← 颜色常量
│   └── strings.dart             ← 文本常量
│
└── utils/                       ← 工具函数
    ├── validators.dart          ← 表单验证
    └── formatters.dart          ← 数据格式化
```

---

## 📚 各目录详细说明

### 1️⃣ `main.dart` - 应用入口

**作用：**
- Flutter 应用的入口文件
- 初始化全局配置（GetX、ScreenUtil、主题等）
- 注册全局控制器

**对比 Web 开发：**
- React: `index.jsx` + `App.jsx`
- Vue: `main.js` + `App.vue`
- uniapp: `main.js` + `App.vue`

**示例：**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化全局控制器
  Get.put(CartController(), permanent: true);
  final authController = Get.put(AuthController(), permanent: true);
  
  // 加载认证状态
  await authController.checkLoginStatus();
  
  runApp(const MyFlutterLearningApp());
}
```

---

### 2️⃣ `screens/` - 页面级组件

**作用：**
- 存放应用的所有页面（Screen/Page）
- 每个页面通常对应一个路由
- 包含页面的布局和业务逻辑

**对比 Web 开发：**
- React: `pages/` 或 `views/`
- Vue: `views/` 或 `pages/`
- Next.js: `pages/` 或 `app/`

**命名规范：**
- 文件名：`snake_case` （例如：`home_screen.dart`）
- 类名：`PascalCase` （例如：`HomeScreen`）

**示例：**
```dart
// lib/screens/home_screen.dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
```

---

### 3️⃣ `widgets/` - 可复用组件

**作用：**
- 存放可复用的自定义组件
- 跨页面使用的通用 UI 组件
- 封装的业务组件

**对比 Web 开发：**
- React/Vue: `components/`
- uniapp: `components/`

**何时创建组件：**
- ✅ 多个页面使用同一个 UI 元素
- ✅ 单个页面的 Widget 树过于复杂，需要拆分
- ✅ 某个功能需要封装成独立组件

**示例：**
```dart
// lib/widgets/app_drawer.dart
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(...);
  }
}
```

---

### 4️⃣ `controllers/` - 状态管理

**作用：**
- 使用 GetX 管理应用状态
- 处理业务逻辑
- 与 Service 层交互

**对比 Web 开发：**
- React: Redux `store/` 或 Context API
- Vue: Vuex/Pinia `store/`
- React Hooks: `useContext` + `useState`

**GetX 控制器类型：**

| 类型 | 生命周期 | 使用场景 |
|------|---------|---------|
| **局部控制器** | 跟随页面 | 单页状态（表单、计数器） |
| **全局控制器** | 应用级 | 用户信息、购物车、主题 |

**示例：**
```dart
// lib/controllers/cart_controller.dart
class CartController extends GetxController {
  var items = <CartItem>[].obs;  // 响应式列表
  
  void addItem(CartItem item) {
    items.add(item);
  }
}
```

**使用：**
```dart
// 注册（在 main.dart）
Get.put(CartController(), permanent: true);

// 获取
final CartController controller = Get.find<CartController>();

// 响应式UI
Obx(() => Text('${controller.items.length}'));
```

---

### 5️⃣ `models/` - 数据模型

**作用：**
- 定义应用的数据结构
- 提供 JSON 序列化/反序列化
- 类型安全

**对比 Web 开发：**
- TypeScript: `types/` 或 `interfaces/`
- JavaScript: `models/`

**模型包含：**
- ✅ 属性定义
- ✅ 构造函数
- ✅ `fromJson()` - 从 JSON 创建对象
- ✅ `toJson()` - 转换为 JSON
- ✅ `copyWith()` - 复制并修改对象

**示例：**
```dart
// lib/models/product.dart
class Product {
  final String id;
  final String name;
  final double price;
  
  Product({required this.id, required this.name, required this.price});
  
  // 从 JSON 创建
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
  
  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price};
  }
  
  // 复制对象
  Product copyWith({String? id, String? name, double? price}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }
}
```

---

### 6️⃣ `services/` - API 服务层

**作用：**
- 封装后端 API 请求
- 处理网络通信
- 数据转换（JSON → Model）

**对比 Web 开发：**
- Axios: `api/` 或 `services/`
- Fetch: `api/`

**本项目特点：**
- ✅ **模拟 API**：无需真实后端，便于学习
- ✅ **模拟延迟**：还原真实网络请求体验
- ✅ **模拟数据**：内置测试数据

**示例：**
```dart
// lib/services/product_service.dart
class ProductService {
  final ApiService _apiService = ApiService();
  
  // 获取商品列表（模拟）
  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(milliseconds: 800)); // 模拟延迟
    return _mockProducts;
  }
  
  // 模拟数据
  static final List<Product> _mockProducts = [
    Product(id: '1', name: 'iPhone 15 Pro', price: 8999, ...),
    Product(id: '2', name: 'MacBook Pro', price: 25999, ...),
  ];
}
```

**使用：**
```dart
final productService = ProductService();
final products = await productService.getProducts();
```

---

### 7️⃣ `routes/` - 路由配置

**作用：**
- 定义应用的所有路由
- 路由命名和映射
- 页面跳转管理

**对比 Web 开发：**
- React Router: `routes.js`
- Vue Router: `router/index.js`
- Next.js: `pages/` 目录结构

**路由文件：**

#### `app_routes.dart` - 路由常量
```dart
class AppRoutes {
  static const String home = '/';
  static const String profile = '/user-profile';
  static const String cart = '/cart-demo';
}
```

#### `app_pages.dart` - 路由映射
```dart
class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.profile, page: () => const UserProfileScreen()),
    GetPage(name: AppRoutes.cart, page: () => const CartDemoScreen()),
  ];
}
```

**使用：**
```dart
// 跳转
Get.toNamed(AppRoutes.profile);

// 带参数跳转
Get.toNamed(AppRoutes.productDetail, arguments: {'id': '123'});

// 返回
Get.back();
```

---

### 8️⃣ `constants/` - 常量配置

**作用：**
- 统一管理应用常量
- 避免硬编码
- 便于维护和修改

**对比 Web 开发：**
- `constants/` 或 `config/`

**常量文件：**

#### `colors.dart` - 颜色常量
```dart
class AppColors {
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFFEC4899);
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
}
```

#### `strings.dart` - 文本常量
```dart
class AppStrings {
  static const String appName = 'Flutter 教学项目';
  static const String buttonConfirm = '确认';
  static const String buttonCancel = '取消';
  static const String errorRequired = '此字段不能为空';
}
```

**使用：**
```dart
// 使用颜色
Container(color: AppColors.primary)

// 使用文本
Text(AppStrings.buttonConfirm)
```

---

### 9️⃣ `utils/` - 工具函数

**作用：**
- 提供通用工具方法
- 代码复用
- 提高开发效率

**对比 Web 开发：**
- `utils/` 或 `helpers/`

**工具文件：**

#### `validators.dart` - 表单验证
```dart
class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '邮箱不能为空';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '邮箱格式不正确';
    }
    return null;
  }
  
  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return '密码不能为空';
    }
    if (value.length < minLength) {
      return '密码长度不能少于$minLength位';
    }
    return null;
  }
}
```

#### `formatters.dart` - 数据格式化
```dart
class Formatters {
  static String currency(double amount, {String symbol = '¥'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }
  
  static String date(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  
  static String relativeTime(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 0) return '${diff.inDays}天前';
    if (diff.inHours > 0) return '${diff.inHours}小时前';
    return '${diff.inMinutes}分钟前';
  }
}
```

**使用：**
```dart
// 表单验证
TextFormField(
  validator: Validators.email,
)

// 格式化金额
Text(Formatters.currency(8999.00))  // ¥8999.00

// 格式化时间
Text(Formatters.relativeTime(DateTime(2024, 1, 1)))  // 10天前
```

---

## 🔄 数据流向

```
┌─────────┐
│  View   │ (screens/ & widgets/)
│ (UI层)  │
└────┬────┘
     │ 用户交互
     ↓
┌─────────────┐
│ Controller  │ (controllers/)
│ (业务逻辑层) │
└──────┬──────┘
       │ 调用服务
       ↓
┌─────────────┐
│  Service    │ (services/)
│ (数据层)    │
└──────┬──────┘
       │ 返回数据
       ↓
┌─────────────┐
│   Model     │ (models/)
│ (数据模型)   │
└─────────────┘
```

**完整流程示例：**

1. **用户点击按钮**（View 层）
   ```dart
   ElevatedButton(
     onPressed: () => controller.addToCart(product),
     child: Text('加入购物车'),
   )
   ```

2. **调用控制器方法**（Controller 层）
   ```dart
   class CartController extends GetxController {
     void addToCart(Product product) {
       final item = CartItem(
         id: product.id,
         name: product.name,
         price: product.price,
       );
       items.add(item);
       Get.snackbar('成功', '已加入购物车');
     }
   }
   ```

3. **（可选）调用服务层**（Service 层）
   ```dart
   final response = await cartService.addItem(item);
   ```

4. **更新 UI**（响应式更新）
   ```dart
   Obx(() => Text('购物车: ${controller.items.length}'))
   ```

---

## 📋 目录结构对比

### Flutter vs Web 开发

| Flutter | React | Vue | uniapp | 作用 |
|---------|-------|-----|--------|------|
| `screens/` | `pages/` | `views/` | `pages/` | 页面 |
| `widgets/` | `components/` | `components/` | `components/` | 组件 |
| `controllers/` | `store/` | `store/` | `store/` | 状态管理 |
| `models/` | `types/` | `types/` | `models/` | 数据模型 |
| `services/` | `api/` | `api/` | `api/` | API 服务 |
| `routes/` | `routes/` | `router/` | `pages.json` | 路由 |
| `constants/` | `constants/` | `constants/` | `common/` | 常量 |
| `utils/` | `utils/` | `utils/` | `utils/` | 工具函数 |

---

## 💡 最佳实践

### 1. 命名规范

| 类型 | 规范 | 示例 |
|------|------|------|
| **文件名** | snake_case | `home_screen.dart` |
| **类名** | PascalCase | `HomeScreen` |
| **变量名** | camelCase | `userName` |
| **常量名** | lowerCamelCase | `primaryColor` |
| **私有变量** | \_camelCase | `_count` |

### 2. 导入顺序

```dart
// 1. Dart SDK
import 'dart:async';

// 2. Flutter SDK
import 'package:flutter/material.dart';

// 3. 第三方包
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// 4. 项目内部
import 'package:my_first_ios_app/models/product.dart';
import 'package:my_first_ios_app/services/product_service.dart';
```

### 3. 文件组织

- ✅ 一个文件只包含一个主要类
- ✅ 相关的小类可以放在同一个文件
- ✅ 超过300行考虑拆分
- ✅ 复杂的页面拆分成多个 Widget

### 4. 目录创建原则

- ✅ 超过3个同类文件，创建子目录
- ✅ 子目录不超过3层
- ✅ 使用 `index.dart` 统一导出（可选）

---

## 🎯 学习建议

### 1️⃣ 从简单到复杂
```
main.dart → screens/ → widgets/ → controllers/ → models/ → services/
```

### 2️⃣ 边学边用
- 📖 阅读 `models/` 中的数据模型定义
- 🎨 查看 `widgets/` 中的组件封装
- 🔧 理解 `utils/` 中的工具函数
- 🌐 学习 `services/` 中的 API 模拟

### 3️⃣ 对比 Web 开发
- 利用已有的 React/Vue 经验
- 理解 Flutter 的"一切皆 Widget"理念
- 掌握 GetX 状态管理（类似 Redux/Vuex）

---

## ✅ 完成！

现在你的项目结构已经完整，符合业界最佳实践！🎉

**下一步：**
- 📖 阅读 `models/` 中的模型定义
- 🔧 使用 `utils/` 中的工具函数
- 🌐 查看 `services/` 中的模拟 API
- 🎨 在 `constants/` 中统一管理颜色和文本
