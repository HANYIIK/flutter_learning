import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedGender = '男';
  bool _agreeToTerms = false;
  double _rating = 3.0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('表单与输入'),
        backgroundColor: const Color(0xFF10B981),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 文本输入
            _buildSection(
              title: '文本输入',
              icon: Iconsax.edit_2,
              child: Column(
                children: [
                  // 姓名输入
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: '姓名',
                      hintText: '请输入您的姓名',
                      prefixIcon: const Icon(Iconsax.user),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入姓名';
                      }
                      return null;
                    },
                  ),
                  
                  const Gap(16),
                  
                  // 邮箱输入
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: '邮箱',
                      hintText: 'example@email.com',
                      prefixIcon: const Icon(Iconsax.sms),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入邮箱';
                      }
                      if (!value.contains('@')) {
                        return '请输入有效的邮箱地址';
                      }
                      return null;
                    },
                  ),
                  
                  const Gap(16),
                  
                  // 密码输入
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      prefixIcon: const Icon(Iconsax.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入密码';
                      }
                      if (value.length < 6) {
                        return '密码至少需要6个字符';
                      }
                      return null;
                    },
                  ),
                  
                  const Gap(16),
                  
                  // 多行文本输入
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: '个人简介',
                      hintText: '介绍一下你自己...',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            
            const Gap(24),
            
            // 选择器
            _buildSection(
              title: '选择器',
              icon: Iconsax.tick_circle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 单选按钮
                  const Text(
                    '性别：',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('男'),
                          value: '男',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('女'),
                          value: '女',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const Gap(16),
                  
                  // 复选框
                  CheckboxListTile(
                    title: const Text('我同意服务条款和隐私政策'),
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  
                  const Gap(16),
                  
                  // 滑块评分
                  const Text(
                    '评分：',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Icon(
                              index < _rating.round()
                                  ? Iconsax.star1
                                  : Iconsax.star,
                              color: const Color(0xFFF59E0B),
                              size: 32,
                            );
                          }),
                        ),
                        Slider(
                          value: _rating,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: _rating.round().toString(),
                          onChanged: (value) {
                            setState(() {
                              _rating = value;
                            });
                          },
                        ),
                        Text(
                          '${_rating.round()} 星',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const Gap(16),
                  
                  // 下拉菜单
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: '选择城市',
                      prefixIcon: const Icon(Iconsax.location),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                    ),
                    items: ['北京', '上海', '广州', '深圳', '杭州']
                        .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            
            const Gap(24),
            
            // 日期和时间选择
            _buildSection(
              title: '日期和时间',
              icon: Iconsax.calendar,
              child: Column(
                children: [
                  // 日期选择器
                  OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        _showSnackBar('选择的日期：${date.year}-${date.month}-${date.day}');
                      }
                    },
                    icon: const Icon(Iconsax.calendar_1),
                    label: const Text('选择日期'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  
                  const Gap(12),
                  
                  // 时间选择器
                  OutlinedButton.icon(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        _showSnackBar('选择的时间：${time.hour}:${time.minute}');
                      }
                    },
                    icon: const Icon(Iconsax.clock),
                    label: const Text('选择时间'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const Gap(24),
            
            // 提交按钮
            FilledButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (!_agreeToTerms) {
                    _showSnackBar('请同意服务条款');
                    return;
                  }
                  _showDialog();
                }
              },
              icon: const Icon(Iconsax.tick_circle),
              label: const Text('提交表单'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color(0xFF10B981),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            
            const Gap(16),
            
            // 重置按钮
            OutlinedButton.icon(
              onPressed: () {
                _formKey.currentState!.reset();
                _nameController.clear();
                _emailController.clear();
                _passwordController.clear();
                setState(() {
                  _selectedGender = '男';
                  _agreeToTerms = false;
                  _rating = 3.0;
                  _obscurePassword = true;
                });
                _showSnackBar('表单已重置');
              },
              icon: const Icon(Iconsax.refresh),
              label: const Text('重置表单'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF10B981)),
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
            child,
          ],
        ),
      ),
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Iconsax.tick_circle,
          color: Color(0xFF10B981),
          size: 48,
        ),
        title: const Text('提交成功！'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('姓名：${_nameController.text}'),
            Text('邮箱：${_emailController.text}'),
            Text('性别：$_selectedGender'),
            Text('评分：${_rating.round()} 星'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

