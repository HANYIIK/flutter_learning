import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          padding: const EdgeInsets.all(20),
          children: [
            // 现代化文本输入
            _buildModernSection(
              title: '个人信息',
              subtitle: '请填写您的基本信息',
              icon: Iconsax.user_edit,
              iconColor: const Color(0xFF6366F1),
              child: Column(
                children: [
                  // 姓名输入 - 现代化设计
                  _buildModernTextField(
                    controller: _nameController,
                    label: '姓名',
                    hint: '请输入您的姓名',
                    icon: Iconsax.user,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入姓名';
                      }
                      return null;
                    },
                  ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1),

                  const Gap(20),

                  // 邮箱输入
                  _buildModernTextField(
                    controller: _emailController,
                    label: '邮箱地址',
                    hint: 'example@email.com',
                    icon: Iconsax.sms,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入邮箱';
                      }
                      if (!value.contains('@')) {
                        return '请输入有效的邮箱地址';
                      }
                      return null;
                    },
                  ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),

                  const Gap(20),

                  // 密码输入 - 现代化设计
                  _buildModernTextField(
                    controller: _passwordController,
                    label: '密码',
                    hint: '至少 6 个字符',
                    icon: Iconsax.lock,
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                        color: const Color(0xFF6366F1),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
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
                  ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),
                ],
              ),
            ),

            const Gap(24),

            // 现代化选择器
            _buildModernSection(
              title: '偏好设置',
              subtitle: '选择您的偏好选项',
              icon: Iconsax.setting_2,
              iconColor: const Color(0xFFEC4899),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 性别选择 - 现代化按钮组
                  const Text(
                    '性别',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildGenderButton(
                          label: '男',
                          icon: Iconsax.man,
                          isSelected: _selectedGender == '男',
                          onTap: () {
                            setState(() => _selectedGender = '男');
                          },
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: _buildGenderButton(
                          label: '女',
                          icon: Iconsax.woman,
                          isSelected: _selectedGender == '女',
                          onTap: () {
                            setState(() => _selectedGender = '女');
                          },
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 100.ms),

                  const Gap(24),

                  // 评分 - 现代化设计
                  const Text(
                    '服务评分',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFF59E0B).withOpacity(0.1),
                          const Color(0xFFFBBF24).withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFF59E0B).withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Icon(
                                index < _rating.round()
                                    ? Iconsax.star1
                                    : Iconsax.star,
                                color: const Color(0xFFF59E0B),
                                size: 36,
                              ),
                            );
                          }),
                        ),
                        const Gap(8),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: const Color(0xFFF59E0B),
                            inactiveTrackColor: const Color(
                              0xFFF59E0B,
                            ).withOpacity(0.2),
                            thumbColor: const Color(0xFFF59E0B),
                            overlayColor: const Color(
                              0xFFF59E0B,
                            ).withOpacity(0.2),
                            trackHeight: 4,
                          ),
                          child: Slider(
                            value: _rating,
                            min: 0,
                            max: 5,
                            divisions: 5,
                            onChanged: (value) {
                              setState(() {
                                _rating = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          _rating.round() == 0
                              ? '未评分'
                              : '${_rating.round()} 星 ${_getRatingText(_rating.round())}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF59E0B),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms).scale(),

                  const Gap(24),

                  // 同意条款 - 现代化设计
                  Container(
                    decoration: BoxDecoration(
                      color: _agreeToTerms
                          ? const Color(0xFF10B981).withOpacity(0.1)
                          : Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _agreeToTerms
                            ? const Color(0xFF10B981).withOpacity(0.3)
                            : Colors.grey.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
                    child: CheckboxListTile(
                      title: const Text(
                        '我同意服务条款和隐私政策',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                      activeColor: const Color(0xFF10B981),
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                  ).animate().fadeIn(delay: 300.ms),
                ],
              ),
            ),

            const Gap(32),

            // 现代化提交按钮
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF10B981), const Color(0xFF059669)],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (!_agreeToTerms) {
                        Get.snackbar(
                          '提示',
                          '请同意服务条款',
                          backgroundColor: Colors.orange,
                          colorText: Colors.white,
                          icon: const Icon(
                            Iconsax.warning_2,
                            color: Colors.white,
                          ),
                        );
                        return;
                      }
                      _showDialog();
                    }
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.tick_circle, color: Colors.white),
                        const Gap(12),
                        const Text(
                          '提交表单',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),

            const Gap(16),

            // 重置按钮 - 简洁设计
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
                Get.snackbar(
                  '已重置',
                  '表单已重置为初始状态',
                  backgroundColor: Colors.grey[200],
                  icon: const Icon(Iconsax.refresh),
                );
              },
              icon: const Icon(Iconsax.refresh),
              label: const Text('重置表单'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ).animate().fadeIn(delay: 500.ms),

            const Gap(20),
          ],
        ),
      ),
    );
  }

  // 现代化 Section 标题
  Widget _buildModernSection({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [iconColor, iconColor.withOpacity(0.7)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const Gap(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        const Gap(20),
        child,
      ],
    );
  }

  // 现代化文本输入框
  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const Gap(8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.normal,
              ),
              prefixIcon: Icon(icon, color: const Color(0xFF6366F1), size: 20),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF6366F1),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 性别按钮
  Widget _buildGenderButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    const Color(0xFFEC4899),
                    const Color(0xFFEC4899).withOpacity(0.8),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.grey[100],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? const Color(0xFFEC4899) : Colors.grey[300]!,
            width: isSelected ? 2 : 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 22,
            ),
            const Gap(8),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1:
        return '很差';
      case 2:
        return '较差';
      case 3:
        return '一般';
      case 4:
        return '满意';
      case 5:
        return '非常满意';
      default:
        return '';
    }
  }

  void _showDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF10B981), const Color(0xFF059669)],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Iconsax.tick_circle,
                color: Colors.white,
                size: 48,
              ),
            ),
            const Gap(20),
            const Text(
              '提交成功！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('姓名', _nameController.text, Iconsax.user),
                  const Divider(height: 20),
                  _buildInfoRow('邮箱', _emailController.text, Iconsax.sms),
                  const Divider(height: 20),
                  _buildInfoRow('性别', _selectedGender, Iconsax.people),
                  const Divider(height: 20),
                  _buildInfoRow(
                    '评分',
                    '${_rating.round()} 星 ${_getRatingText(_rating.round())}',
                    Iconsax.star1,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Get.back(),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                padding: const EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('确定', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF10B981)),
        const Gap(8),
        Text(
          '$label: ',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
