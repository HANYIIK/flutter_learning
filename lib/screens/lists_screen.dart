import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../controllers/cart_controller.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _fruits = [
    {'name': '苹果', 'icon': Iconsax.home, 'color': Colors.red},
    {'name': '香蕉', 'icon': FontAwesomeIcons.seedling, 'color': Colors.yellow},
    {'name': '橙子', 'icon': Iconsax.lovely, 'color': Colors.orange},
    {'name': '葡萄', 'icon': Iconsax.heart_circle, 'color': Colors.purple},
    {'name': '草莓', 'icon': Iconsax.heart, 'color': Colors.pink},
    {'name': '西瓜', 'icon': Iconsax.award, 'color': Colors.green},
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'iPhone 15 Pro',
      'price': '¥8999',
      'icon': Iconsax.mobile,
      'color': const Color(0xFF6366F1),
    },
    {
      'name': 'MacBook Pro',
      'price': '¥14999',
      'icon': Iconsax.monitor,
      'color': const Color(0xFFEC4899),
    },
    {
      'name': 'iPad Air',
      'price': '¥4799',
      'icon': Iconsax.airpod,
      'color': const Color(0xFF10B981),
    },
    {
      'name': 'Apple Watch',
      'price': '¥3199',
      'icon': Iconsax.watch,
      'color': const Color(0xFFF59E0B),
    },
    {
      'name': 'AirPods Pro',
      'price': '¥1899',
      'icon': Iconsax.headphone,
      'color': const Color(0xFF8B5CF6),
    },
    {
      'name': 'Magic Mouse',
      'price': '¥799',
      'icon': Iconsax.mouse_1,
      'color': const Color(0xFF06B6D4),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表与网格'),
        backgroundColor: const Color(0xFFF59E0B),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          tabs: const [
            Tab(text: '基础列表'),
            Tab(text: '卡片列表'),
            Tab(text: '网格布局'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicList(),
          _buildCardList(),
          _buildGridView(),
        ],
      ),
    );
  }

  // 基础列表
  Widget _buildBasicList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.menu_board, color: Color(0xFFF59E0B)),
                    const Gap(8),
                    const Text(
                      'ListView 基础列表',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                
                // 简单列表项
                ...List.generate(_fruits.length, (index) {
                  final fruit = _fruits[index];
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (fruit['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        fruit['icon'] as IconData,
                        color: fruit['color'] as Color,
                      ),
                    ),
                    title: Text(fruit['name'] as String),
                    subtitle: Text('这是 ${fruit['name']}'),
                    trailing: IconButton(
                      icon: const Icon(Iconsax.heart),
                      onPressed: () {
                        _showSnackBar('喜欢 ${fruit['name']}');
                      },
                    ),
                    onTap: () {
                      _showSnackBar('点击了 ${fruit['name']}');
                    },
                  );
                }),
              ],
            ),
          ),
        ),
        
        const Gap(16),
        
        // 可展开列表
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.arrow_down_1, color: Color(0xFFF59E0B)),
                    const Gap(8),
                    const Text(
                      '可展开列表',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                ExpansionTile(
                  leading: const Icon(Iconsax.folder_2),
                  title: const Text('Flutter 基础'),
                  children: [
                    ListTile(
                      leading: const Icon(Iconsax.document_text),
                      title: const Text('Widget 介绍'),
                      dense: true,
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.document_text),
                      title: const Text('布局系统'),
                      dense: true,
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Iconsax.folder_2),
                  title: const Text('进阶主题'),
                  children: [
                    ListTile(
                      leading: const Icon(Iconsax.document_text),
                      title: const Text('状态管理'),
                      dense: true,
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.document_text),
                      title: const Text('网络请求'),
                      dense: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 卡片列表
  Widget _buildCardList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                // 跳转到产品详情页，并传递参数
                Get.toNamed(
                  '/product-detail',
                  arguments: {
                    ...product,
                    'description': '这是一款优秀的 ${product['name']}，'
                        '采用最新技术打造，为您带来极致体验。具有强大的性能、'
                        '精美的外观设计和可靠的质量保证。',
                  },
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 产品图标
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            product['color'] as Color,
                            (product['color'] as Color).withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        product['icon'] as IconData,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const Gap(16),
                    // 产品信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            product['name'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            product['price'] as String,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: product['color'] as Color,
                            ),
                          ),
                          const Gap(4),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Iconsax.star1,
                                size: 14,
                                color: const Color(0xFFF59E0B),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    // 操作按钮
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _showSnackBar('收藏 ${product['name']}');
                          },
                          icon: const Icon(Iconsax.heart, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                (product['color'] as Color).withOpacity(0.1),
                            foregroundColor: product['color'] as Color,
                            padding: const EdgeInsets.all(8),
                            minimumSize: const Size(36, 36),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        const Gap(6),
                        IconButton(
                          onPressed: () {
                            // 添加到购物车
                            final CartController cartController = Get.find<CartController>();
                            cartController.addItem(
                              CartItem(
                                id: product['name'] as String,
                                name: product['name'] as String,
                                price: double.parse(
                                    (product['price'] as String).replaceAll('¥', '').replaceAll(',', '')),
                                icon: product['icon'].toString(),
                              ),
                            );
                          },
                          icon: const Icon(Iconsax.shopping_cart, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                (product['color'] as Color).withOpacity(0.1),
                            foregroundColor: product['color'] as Color,
                            padding: const EdgeInsets.all(8),
                            minimumSize: const Size(36, 36),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // 网格布局
  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return Card(
          elevation: 2,
          child: InkWell(
            onTap: () {
              // 跳转到产品详情页
              Get.toNamed(
                '/product-detail',
                arguments: {
                  ...product,
                  'description': '这是一款优秀的 ${product['name']}，'
                      '采用最新技术打造，为您带来极致体验。',
                },
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 产品图标
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          product['color'] as Color,
                          (product['color'] as Color).withOpacity(0.6),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      product['icon'] as IconData,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const Gap(10),
                  // 产品名称
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(6),
                  // 价格
                  Text(
                    product['price'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: product['color'] as Color,
                    ),
                  ),
                  const Gap(6),
                  // 星级
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        Iconsax.star1,
                        size: 11,
                        color: const Color(0xFFF59E0B),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

