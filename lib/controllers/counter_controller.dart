import 'package:get/get.dart';

/// 计数器控制器
/// 演示 GetX 最简单的状态管理
class CounterController extends GetxController {
  // 响应式变量（.obs 让变量变成响应式）
  var count = 0.obs;
  
  // 增加计数
  void increment() {
    count++;
  }
  
  // 减少计数
  void decrement() {
    count--;
  }
  
  // 重置计数
  void reset() {
    count.value = 0;
  }
  
  // 设置特定值
  void setValue(int value) {
    count.value = value;
  }
}

