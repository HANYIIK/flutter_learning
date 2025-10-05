import 'package:get/get.dart';
import 'package:my_first_ios_app/models/cart_item.dart';

/// 购物车控制器
/// 演示 GetX 复杂状态管理：列表操作、计算属性等
class CartController extends GetxController {
  // 购物车商品列表（响应式）
  var items = <CartItem>[].obs;

  // 计算总价（响应式计算属性）
  double get totalPrice => items.fold(0, (sum, item) => sum + item.total);

  // 计算商品总数
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  // 添加商品到购物车
  void addItem(CartItem item) {
    // 检查是否已存在
    final index = items.indexWhere((i) => i.id == item.id);
    if (index >= 0) {
      // 已存在，增加数量
      items[index].quantity++;
      items.refresh(); // 刷新列表
    } else {
      // 不存在，添加新商品
      items.add(item);
    }

    // 显示提示
    Get.snackbar(
      '已添加',
      '${item.name} 已加入购物车',
      duration: const Duration(seconds: 1),
    );
  }

  // 移除商品
  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
  }

  // 增加商品数量
  void increaseQuantity(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      items[index].quantity++;
      items.refresh();
    }
  }

  // 减少商品数量
  void decreaseQuantity(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index >= 0 && items[index].quantity > 1) {
      items[index].quantity--;
      items.refresh();
    }
  }

  // 清空购物车
  void clearCart() {
    items.clear();
    Get.snackbar('购物车已清空', '所有商品已移除');
  }
}
