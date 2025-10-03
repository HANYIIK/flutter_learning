import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BasicWidgetsScreen extends StatefulWidget {
  const BasicWidgetsScreen({super.key});

  @override
  State<BasicWidgetsScreen> createState() => _BasicWidgetsScreenState();
}

class _BasicWidgetsScreenState extends State<BasicWidgetsScreen> {
  int _counter = 0;
  bool _switchValue = false;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础组件'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 按钮部分
          _buildSection(
            title: '按钮组件',
            icon: Iconsax.play_circle,
            children: [
              const Text('Flutter 提供了多种按钮样式：'),
              const Gap(16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => _showSnackBar('点击了 Elevated Button'),
                    child: const Text('Elevated Button'),
                  ),
                  FilledButton(
                    onPressed: () => _showSnackBar('点击了 Filled Button'),
                    child: const Text('Filled Button'),
                  ),
                  OutlinedButton(
                    onPressed: () => _showSnackBar('点击了 Outlined Button'),
                    child: const Text('Outlined Button'),
                  ),
                  TextButton(
                    onPressed: () => _showSnackBar('点击了 Text Button'),
                    child: const Text('Text Button'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _showSnackBar('带图标的按钮'),
                    icon: const Icon(Iconsax.heart5),
                    label: const Text('Icon Button'),
                  ),
                ],
              ),
            ],
          ),
          
          const Gap(24),
          
          // 文本组件
          _buildSection(
            title: '文本组件',
            icon: Iconsax.text,
            children: [
              const Text(
                '普通文本',
                style: TextStyle(fontSize: 16),
              ),
              const Gap(8),
              const Text(
                '粗体文本',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              Text(
                '彩色文本',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(8),
              const Text(
                '这是一段很长的文本，用来演示文本如何在容器中换行显示。Flutter 的 Text 组件功能非常强大，支持各种样式设置。',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          
          const Gap(24),
          
          // Icon 组件
          _buildSection(
            title: 'Icon 图标库',
            icon: Iconsax.emoji_happy,
            children: [
              const Text('使用了 Iconsax 和 FontAwesome 图标库：'),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconExample(Iconsax.home, '首页', Colors.blue),
                  _buildIconExample(Iconsax.heart5, '喜欢', Colors.red),
                  _buildIconExample(Iconsax.star1, '星标', Colors.orange),
                  _buildIconExample(FontAwesomeIcons.rocket, '火箭', Colors.purple),
                ],
              ),
            ],
          ),
          
          const Gap(24),
          
          // 交互组件
          _buildSection(
            title: '交互组件',
            icon: Iconsax.finger_cricle,
            children: [
              // 计数器
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '计数器示例：',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() => _counter--);
                          },
                          icon: const Icon(Iconsax.minus),
                        ),
                        Text(
                          '$_counter',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() => _counter++);
                          },
                          icon: const Icon(Iconsax.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(16),
              
              // Switch 开关
              SwitchListTile(
                title: const Text('开关示例'),
                subtitle: Text(_switchValue ? '已开启' : '已关闭'),
                value: _switchValue,
                onChanged: (value) {
                  setState(() => _switchValue = value);
                },
              ),
              
              const Gap(16),
              
              // Slider 滑块
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('滑块示例：${_sliderValue.round()}'),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _sliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() => _sliderValue = value);
                    },
                  ),
                ],
              ),
            ],
          ),
          
          const Gap(24),
          
          // 容器和布局
          _buildSection(
            title: '容器与布局',
            icon: Iconsax.layer,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          '渐变容器',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '阴影容器',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const Gap(24),
          
          // GetX 路由演示
          _buildSection(
            title: 'GetX 路由跳转',
            icon: Iconsax.routing,
            children: [
              const Text('体验 GetX 路由管理和页面跳转：'),
              const Gap(16),
              _buildRouteButton(
                context,
                title: '计数器演示',
                subtitle: '简单状态管理',
                icon: Iconsax.chart,
                color: const Color(0xFF6366F1),
                onTap: () => Get.toNamed('/counter-demo'),
              ),
              const Gap(12),
              _buildRouteButton(
                context,
                title: '用户资料',
                subtitle: '全局状态管理',
                icon: Iconsax.user,
                color: const Color(0xFFEC4899),
                onTap: () => Get.toNamed('/user-profile'),
              ),
              const Gap(12),
              _buildRouteButton(
                context,
                title: '设置页面',
                subtitle: '应用设置',
                icon: Iconsax.setting_2,
                color: const Color(0xFF10B981),
                onTap: () => Get.toNamed('/settings'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildRouteButton(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: color.withOpacity(0.1),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Iconsax.arrow_right_3, color: color),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const Gap(8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildIconExample(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const Gap(8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
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

