import 'package:get/get.dart';
import 'package:my_first_ios_app/screens/home_screen.dart';
import 'package:my_first_ios_app/screens/details/product_detail_screen.dart';
import 'package:my_first_ios_app/screens/details/user_profile_screen.dart';
import 'package:my_first_ios_app/screens/details/settings_screen.dart';
import 'package:my_first_ios_app/screens/details/about_screen.dart';
import 'package:my_first_ios_app/screens/details/counter_demo_screen.dart';
import 'package:my_first_ios_app/screens/details/cart_demo_screen.dart';
import 'package:my_first_ios_app/routes/app_routes.dart';

/// GetX 路由配置
/// 这里配置所有的路由页面和过渡动画
class AppPages {
  static final routes = [
    // 主页面
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),

    // 产品详情页
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailScreen(),
      transition: Transition.rightToLeft,
    ),

    // 用户资料页
    GetPage(
      name: AppRoutes.userProfile,
      page: () => const UserProfileScreen(),
      transition: Transition.rightToLeft,
    ),

    // 设置页面
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
      transition: Transition.rightToLeft,
    ),

    // 关于页面
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutScreen(),
      transition: Transition.cupertino,
    ),

    // 计数器演示（状态管理）
    GetPage(
      name: AppRoutes.counterDemo,
      page: () => const CounterDemoScreen(),
      transition: Transition.zoom,
    ),

    // 购物车演示（复杂状态管理）
    GetPage(
      name: AppRoutes.cartDemo,
      page: () => const CartDemoScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
