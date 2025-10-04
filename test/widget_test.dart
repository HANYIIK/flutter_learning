// Flutter 教学项目测试文件
import 'package:flutter_test/flutter_test.dart';

import 'package:my_first_ios_app/main.dart';

void main() {
  testWidgets('Flutter 教学项目加载测试', (WidgetTester tester) async {
    // 构建应用并触发一帧
    await tester.pumpWidget(const MyFlutterLearningApp());

    // 验证应用标题存在
    expect(find.text('Flutter 教学项目'), findsOneWidget);

    // 验证副标题存在
    expect(find.text('学习 Flutter 的最佳方式 🚀'), findsOneWidget);

    // 验证四个学习模块卡片存在
    expect(find.text('基础组件'), findsOneWidget);
    expect(find.text('动画效果'), findsOneWidget);
    expect(find.text('表单与输入'), findsOneWidget);
    expect(find.text('列表与网格'), findsOneWidget);
  });
}
