import 'package:my_first_ios_app/models/product.dart';

/// 商品服务
/// 模拟商品相关的 API 请求
class ProductService {
  /// 获取商品列表（模拟）
  Future<List<Product>> getProducts() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 800));

    // 返回模拟数据
    return _mockProducts;
  }

  /// 根据分类获取商品（模拟）
  Future<List<Product>> getProductsByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 600));

    return _mockProducts
        .where((product) => product.category == category)
        .toList();
  }

  /// 根据 ID 获取商品详情（模拟）
  Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));

    try {
      return _mockProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 搜索商品（模拟）
  Future<List<Product>> searchProducts(String keyword) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final lowerKeyword = keyword.toLowerCase();
    return _mockProducts
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowerKeyword) ||
              product.description.toLowerCase().contains(lowerKeyword),
        )
        .toList();
  }

  /// 模拟商品数据
  static final List<Product> _mockProducts = [
    Product(
      id: '1',
      name: 'iPhone 15 Pro',
      description: '强大的 A17 Pro 芯片，钛金属设计，专业级相机系统',
      price: 8999,
      imageUrl: '📱',
      category: '电子产品',
      rating: 4.8,
      reviewCount: 1234,
      inStock: true,
    ),
    Product(
      id: '2',
      name: 'MacBook Pro 16"',
      description: 'M3 Max 芯片，极致性能，完美屏幕',
      price: 25999,
      imageUrl: '💻',
      category: '电子产品',
      rating: 4.9,
      reviewCount: 856,
      inStock: true,
    ),
    Product(
      id: '3',
      name: 'AirPods Pro 2',
      description: '主动降噪，空间音频，长续航',
      price: 1899,
      imageUrl: '🎧',
      category: '电子产品',
      rating: 4.7,
      reviewCount: 2341,
      inStock: true,
    ),
    Product(
      id: '4',
      name: 'iPad Air',
      description: 'M2 芯片，10.9 英寸视网膜显示屏',
      price: 4799,
      imageUrl: '📱',
      category: '电子产品',
      rating: 4.6,
      reviewCount: 567,
      inStock: true,
    ),
    Product(
      id: '5',
      name: 'Apple Watch Ultra',
      description: '专业运动手表，双频 GPS，100 米防水',
      price: 6299,
      imageUrl: '⌚',
      category: '可穿戴设备',
      rating: 4.8,
      reviewCount: 432,
      inStock: false,
    ),
    Product(
      id: '6',
      name: 'Magic Mouse',
      description: '无线充电，多点触控表面',
      price: 799,
      imageUrl: '🖱️',
      category: '配件',
      rating: 4.3,
      reviewCount: 1023,
      inStock: true,
    ),
    Product(
      id: '7',
      name: 'Magic Keyboard',
      description: '妙控键盘，触控 ID，低轮廓按键',
      price: 1099,
      imageUrl: '⌨️',
      category: '配件',
      rating: 4.5,
      reviewCount: 789,
      inStock: true,
    ),
    Product(
      id: '8',
      name: 'Studio Display',
      description: '27 英寸 5K 视网膜显示器',
      price: 11499,
      imageUrl: '🖥️',
      category: '显示器',
      rating: 4.7,
      reviewCount: 234,
      inStock: true,
    ),
  ];
}
