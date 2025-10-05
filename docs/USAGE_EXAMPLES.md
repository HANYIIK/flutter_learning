# 使用示例 📝

本文档演示如何使用新的项目结构中的各个模块。

---

## 📦 1. 使用数据模型 (models/)

### 创建商品对象

```dart
import 'package:my_first_ios_app/models/product.dart';

// 直接创建
final product = Product(
  id: '1',
  name: 'iPhone 15 Pro',
  description: '最新款 iPhone',
  price: 8999,
  imageUrl: '📱',
  category: '电子产品',
  rating: 4.8,
  reviewCount: 1234,
);

// 从 JSON 创建
final json = {
  'id': '1',
  'name': 'iPhone 15 Pro',
  'price': 8999,
  // ...
};
final productFromJson = Product.fromJson(json);

// 转换为 JSON
final jsonData = product.toJson();

// 复制并修改
final updatedProduct = product.copyWith(price: 7999);
```

### 创建购物车商品

```dart
import 'package:my_first_ios_app/models/cart_item.dart';

final item = CartItem(
  id: '1',
  name: 'iPhone 15 Pro',
  price: 8999,
  icon: '📱',
  quantity: 2,
);

// 计算总价
print(item.total);  // 17998.0
```

---

## 🌐 2. 使用 API 服务 (services/)

### 获取商品列表

```dart
import 'package:my_first_ios_app/services/product_service.dart';

class MyController extends GetxController {
  final productService = ProductService();
  var products = <Product>[].obs;
  var isLoading = false.obs;
  
  Future<void> loadProducts() async {
    isLoading.value = true;
    try {
      products.value = await productService.getProducts();
    } catch (e) {
      Get.snackbar('错误', '加载商品失败: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
```

### 按分类获取商品

```dart
final products = await productService.getProductsByCategory('电子产品');
```

### 搜索商品

```dart
final results = await productService.searchProducts('iPhone');
```

### 用户登录

```dart
import 'package:my_first_ios_app/services/user_service.dart';

final userService = UserService();

try {
  final user = await userService.login('user@example.com', 'password123');
  print('登录成功: ${user.name}');
} catch (e) {
  print('登录失败: $e');
}
```

---

## 🎨 3. 使用颜色常量 (constants/colors.dart)

```dart
import 'package:my_first_ios_app/constants/colors.dart';

// 使用主题色
Container(
  color: AppColors.primary,  // 蓝紫色
  child: Text(
    'Hello',
    style: TextStyle(color: AppColors.textPrimary),
  ),
)

// 使用功能色
Icon(Icons.check, color: AppColors.success)
Icon(Icons.error, color: AppColors.error)
Icon(Icons.warning, color: AppColors.warning)

// 使用渐变色
Container(
  decoration: BoxDecoration(
    gradient: AppColors.purpleGradient,
  ),
)

// Tab 颜色
Icon(Iconsax.box, color: AppColors.tab1)  // Tab 1 蓝紫色
Icon(Iconsax.electricity, color: AppColors.tab2)  // Tab 2 粉色
Icon(Iconsax.edit, color: AppColors.tab3)  // Tab 3 绿色
Icon(Iconsax.menu_board, color: AppColors.tab4)  // Tab 4 橙色
```

---

## 📝 4. 使用文本常量 (constants/strings.dart)

```dart
import 'package:my_first_ios_app/constants/strings.dart';

// 应用信息
Text(AppStrings.appName)  // Flutter 教学项目
Text(AppStrings.appVersion)  // 1.0.0

// 按钮文本
ElevatedButton(
  onPressed: () {},
  child: Text(AppStrings.buttonConfirm),  // 确认
)

TextButton(
  onPressed: () {},
  child: Text(AppStrings.buttonCancel),  // 取消
)

// 表单标签
TextFormField(
  decoration: InputDecoration(
    labelText: AppStrings.labelName,  // 姓名
    hintText: AppStrings.hintName,    // 请输入姓名
  ),
)

// 页面标题
AppBar(
  title: Text(AppStrings.titleHome),  // 首页
)

// 对话框
AlertDialog(
  title: Text(AppStrings.dialogTitleLogout),      // 退出登录
  content: Text(AppStrings.dialogMessageLogout),  // 确定要退出登录吗？
)
```

---

## ✅ 5. 使用表单验证 (utils/validators.dart)

```dart
import 'package:my_first_ios_app/utils/validators.dart';

// 必填验证
TextFormField(
  validator: (value) => Validators.required(value, fieldName: '用户名'),
)

// 邮箱验证
TextFormField(
  validator: Validators.email,
)

// 密码验证（最少6位）
TextFormField(
  validator: Validators.password,
  obscureText: true,
)

// 强密码验证（包含大小写字母和数字）
TextFormField(
  validator: Validators.strongPassword,
  obscureText: true,
)

// 手机号验证
TextFormField(
  validator: Validators.phone,
)

// 最小长度验证
TextFormField(
  validator: (value) => Validators.minLength(value, 3, fieldName: '昵称'),
)

// 数值范围验证
TextFormField(
  validator: (value) => Validators.range(value, 18, 65, fieldName: '年龄'),
)

// 组合多个验证器
TextFormField(
  validator: (value) => Validators.combine(value, [
    Validators.required,
    Validators.email,
    (v) => Validators.minLength(v, 5, fieldName: '邮箱'),
  ]),
)

// 确认密码验证
TextFormField(
  validator: (value) => Validators.confirmPassword(value, passwordController.text),
)
```

---

## 🎯 6. 使用数据格式化 (utils/formatters.dart)

```dart
import 'package:my_first_ios_app/utils/formatters.dart';

// 格式化金额
Formatters.currency(8999.00)  // ¥8,999.00
Formatters.currency(8999.00, symbol: '\$')  // $8,999.00
Formatters.currencyWithoutSymbol(8999.00)  // 8,999.00

// 格式化日期和时间
final now = DateTime.now();
Formatters.date(now)  // 2024-10-05
Formatters.time(now)  // 14:30:25
Formatters.dateTime(now)  // 2024-10-05 14:30:25
Formatters.dateTimeChinese(now)  // 2024年10月05日 14:30

// 相对时间
final yesterday = DateTime.now().subtract(Duration(days: 1));
Formatters.relativeTime(yesterday)  // 1天前

final twoHoursAgo = DateTime.now().subtract(Duration(hours: 2));
Formatters.relativeTime(twoHoursAgo)  // 2小时前

final justNow = DateTime.now().subtract(Duration(seconds: 30));
Formatters.relativeTime(justNow)  // 刚刚

// 格式化文件大小
Formatters.fileSize(1024)  // 1.00 KB
Formatters.fileSize(1024 * 1024)  // 1.00 MB
Formatters.fileSize(1024 * 1024 * 1024)  // 1.00 GB

// 格式化数字（千分位）
Formatters.number(1234567)  // 1,234,567

// 格式化百分比
Formatters.percentage(0.856)  // 85.6%
Formatters.percentage(0.5, decimals: 0)  // 50%

// 格式化手机号（隐藏中间4位）
Formatters.phoneWithMask('13812345678')  // 138****5678

// 格式化身份证号（隐藏中间部分）
Formatters.idCardWithMask('110101199001011234')  // 1101**********1234

// 格式化银行卡号（每4位一组）
Formatters.bankCard('6222021234567890')  // 6222 0212 3456 7890

// 截断文本
Formatters.truncate('这是一个很长的文本内容', 10)  // 这是一个很长的文本...

// 首字母大写
Formatters.capitalize('hello')  // Hello

// 驼峰命名转下划线
Formatters.camelToSnake('userName')  // user_name

// 下划线命名转驼峰
Formatters.snakeToCamel('user_name')  // userName
```

---

## 🔄 7. 完整示例：商品列表页面

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_ios_app/models/product.dart';
import 'package:my_first_ios_app/services/product_service.dart';
import 'package:my_first_ios_app/constants/colors.dart';
import 'package:my_first_ios_app/constants/strings.dart';
import 'package:my_first_ios_app/utils/formatters.dart';

class ProductListController extends GetxController {
  final productService = ProductService();
  var products = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    try {
      products.value = await productService.getProducts();
    } catch (e) {
      Get.snackbar('错误', '加载商品失败');
    } finally {
      isLoading.value = false;
    }
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductListController());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.titleLists),
        backgroundColor: AppColors.primary,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Text(product.imageUrl, style: TextStyle(fontSize: 40)),
                title: Text(product.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description),
                    Text(
                      Formatters.currency(product.price),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: product.inStock
                    ? Icon(Icons.check_circle, color: AppColors.success)
                    : Icon(Icons.cancel, color: AppColors.error),
                onTap: () {
                  Get.toNamed('/product-detail', arguments: {'id': product.id});
                },
              ),
            );
          },
        );
      }),
    );
  }
}
```

---

## 📋 8. 完整示例：表单页面

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_ios_app/services/user_service.dart';
import 'package:my_first_ios_app/constants/colors.dart';
import 'package:my_first_ios_app/constants/strings.dart';
import 'package:my_first_ios_app/utils/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userService = UserService();

  Future<void> handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await userService.login(
          _emailController.text,
          _passwordController.text,
        );
        
        Get.snackbar(
          AppStrings.successLoggedIn,
          '欢迎回来，${user.name}',
          backgroundColor: AppColors.success,
          colorText: Colors.white,
        );
        
        Get.offAllNamed('/home');
      } catch (e) {
        Get.snackbar(
          '登录失败',
          e.toString(),
          backgroundColor: AppColors.error,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.buttonLogin),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 邮箱输入
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppStrings.labelEmail,
                  hintText: AppStrings.hintEmail,
                  prefixIcon: Icon(Icons.email, color: AppColors.primary),
                ),
                validator: Validators.email,
              ),
              
              const SizedBox(height: 16),
              
              // 密码输入
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppStrings.labelPassword,
                  hintText: AppStrings.hintPassword,
                  prefixIcon: Icon(Icons.lock, color: AppColors.primary),
                ),
                validator: Validators.password,
              ),
              
              const SizedBox(height: 24),
              
              // 登录按钮
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(AppStrings.buttonLogin),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 🎉 完成！

现在你已经了解如何使用项目中的所有模块了！

**快速导航：**
- 📦 [数据模型 (models/)](#-1-使用数据模型-models)
- 🌐 [API 服务 (services/)](#-2-使用-api-服务-services)
- 🎨 [颜色常量 (constants/colors.dart)](#-3-使用颜色常量-constantscolorsdart)
- 📝 [文本常量 (constants/strings.dart)](#-4-使用文本常量-constantsstringsdart)
- ✅ [表单验证 (utils/validators.dart)](#-5-使用表单验证-utilsvalidatorsdart)
- 🎯 [数据格式化 (utils/formatters.dart)](#-6-使用数据格式化-utilsformattersdart)

**更多文档：**
- 📘 [项目结构说明](PROJECT_STRUCTURE.md)
- 📗 [从 Web 到 Flutter](FLUTTER_GUIDE.md)
- 📖 [Widget 速查手册](WIDGET_REFERENCE.md)
- 🔧 [命令速查手册](COMMANDS.md)
