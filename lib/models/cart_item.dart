/// 购物车商品模型
class CartItem {
  final String id;
  final String name;
  final double price;
  final String icon;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.icon,
    this.quantity = 1,
  });

  /// 计算该商品的总价
  double get total => price * quantity;

  /// 从 JSON 创建
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      icon: json['icon'] as String,
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'icon': icon,
      'quantity': quantity,
    };
  }

  /// 复制对象
  CartItem copyWith({
    String? id,
    String? name,
    double? price,
    String? icon,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      icon: icon ?? this.icon,
      quantity: quantity ?? this.quantity,
    );
  }
}
