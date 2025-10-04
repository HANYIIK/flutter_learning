import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:my_first_ios_app/controllers/cart_controller.dart';

/// 购物车演示页面
/// 演示：GetX 复杂状态管理（列表操作）
class CartDemoScreen extends StatelessWidget {
  const CartDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('购物车演示'),
        backgroundColor: const Color(0xFFEC4899),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.trash),
            onPressed: () {
              if (controller.items.isNotEmpty) {
                Get.dialog(
                  AlertDialog(
                    title: const Text('清空购物车'),
                    content: const Text('确定要清空购物车吗？'),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('取消'),
                      ),
                      FilledButton(
                        onPressed: () {
                          controller.clearCart();
                          Get.back();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('清空'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 购物车列表
          Expanded(
            child: Obx(() {
              if (controller.items.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.shopping_cart,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                      const Gap(16),
                      Text(
                        '购物车是空的',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      const Gap(8),
                      Text(
                        '前往列表页面添加商品',
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // 商品图标
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEC4899).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(
                                Iconsax.box,
                                color: Color(0xFFEC4899),
                                size: 30,
                              ),
                            ),
                          ),
                          const Gap(12),
                          // 商品信息
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  '¥${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Color(0xFFEC4899),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 数量控制
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Iconsax.minus_cirlce),
                                    color: Colors.grey,
                                    onPressed: () {
                                      controller.decreaseQuantity(item.id);
                                    },
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Iconsax.add_circle),
                                    color: const Color(0xFFEC4899),
                                    onPressed: () {
                                      controller.increaseQuantity(item.id);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                '小计: ¥${item.total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          // 删除按钮
                          IconButton(
                            icon: const Icon(Iconsax.trash),
                            color: Colors.red,
                            onPressed: () {
                              controller.removeItem(item.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // 底部总计栏
          Obx(
            () => controller.items.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '共 ${controller.totalItems} 件商品',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  '¥${controller.totalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFEC4899),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.snackbar(
                                  '成功',
                                  '订单已提交！总计：¥${controller.totalPrice.toStringAsFixed(2)}',
                                  backgroundColor: const Color(0xFFEC4899),
                                  colorText: Colors.white,
                                );
                                controller.clearCart();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEC4899),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                              ),
                              child: const Text(
                                '去结算',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
