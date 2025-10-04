import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:my_first_ios_app/controllers/cart_controller.dart';

/// 产品详情页
/// 演示：路由参数传递、GetX 状态管理
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取路由传递的参数
    final Map<String, dynamic> product =
        Get.arguments ??
        {
          'name': '示例产品',
          'price': '¥999',
          'icon': Iconsax.mobile,
          'color': const Color(0xFF6366F1),
          'description': '这是一个示例产品描述',
        };

    // 获取购物车控制器（从全局获取，而不是创建新的）
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('产品详情'),
        backgroundColor: product['color'] as Color,
        foregroundColor: Colors.white,
        actions: [
          // 购物车图标（显示商品数量）
          Stack(
            children: [
              IconButton(
                icon: const Icon(Iconsax.shopping_cart),
                onPressed: () {
                  Get.toNamed('/cart-demo');
                },
              ),
              Obx(
                () => cartController.totalItems > 0
                    ? Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${cartController.totalItems}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 产品图片区域
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    product['color'] as Color,
                    (product['color'] as Color).withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  product['icon'] as IconData,
                  size: 120,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 产品名称和价格
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    product['price'] as String,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: product['color'] as Color,
                    ),
                  ),

                  const Gap(16),
                  const Divider(),
                  const Gap(16),

                  // 产品描述
                  const Text(
                    '产品描述',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  Text(
                    product['description'] as String? ??
                        '这是一款优秀的产品，采用最新技术打造，为您带来极致体验。',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  const Gap(24),

                  // 产品特性
                  const Text(
                    '产品特性',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Gap(12),
                  _buildFeature(Iconsax.shield_tick, '品质保证', '严格质检，品质可靠'),
                  _buildFeature(Iconsax.truck_fast, '快速配送', '闪电发货，极速送达'),
                  _buildFeature(Iconsax.security_user, '售后保障', '7天无理由退换货'),

                  const Gap(32),

                  // 加入购物车按钮
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // 添加到购物车
                        cartController.addItem(
                          CartItem(
                            id: product['name'] as String,
                            name: product['name'] as String,
                            price: double.parse(
                              (product['price'] as String)
                                  .replaceAll('¥', '')
                                  .replaceAll(',', ''),
                            ),
                            icon: product['icon'].toString(),
                          ),
                        );
                      },
                      icon: const Icon(Iconsax.shopping_cart),
                      label: const Text(
                        '加入购物车',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: product['color'] as Color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6366F1)),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
