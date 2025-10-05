/// 应用字符串常量
/// 统一管理应用中使用的文本内容
class AppStrings {
  // 私有构造函数，防止实例化
  AppStrings._();

  // ============ 应用信息 ============
  static const String appName = 'Flutter 教学项目';
  static const String appVersion = '1.0.0';
  static const String appDescription = '一个完整的 Flutter 入门教学项目';

  // ============ 底部导航栏 ============
  static const String tabBasics = '基础组件';
  static const String tabAnimations = '动画效果';
  static const String tabForms = '表单输入';
  static const String tabLists = '列表网格';

  // ============ 页面标题 ============
  static const String titleHome = '首页';
  static const String titleBasics = '基础组件';
  static const String titleAnimations = '动画效果';
  static const String titleForms = '表单与输入';
  static const String titleLists = '列表与网格';
  static const String titleProfile = '个人资料';
  static const String titleSettings = '系统设置';
  static const String titleAbout = '关于';
  static const String titleCart = '购物车';
  static const String titleCounter = '计数器演示';
  static const String titleProductDetail = '商品详情';

  // ============ 抽屉菜单 ============
  static const String drawerProfile = '个人资料';
  static const String drawerProfileSubtitle = '查看和编辑个人信息';
  static const String drawerSettings = '系统设置';
  static const String drawerSettingsSubtitle = '应用偏好设置';
  static const String drawerAbout = '关于';
  static const String drawerAboutSubtitle = '应用信息和版本';
  static const String drawerLogout = '退出登录';
  static const String drawerLogoutSubtitle = '安全退出当前账户';

  // ============ 按钮文本 ============
  static const String buttonConfirm = '确认';
  static const String buttonCancel = '取消';
  static const String buttonSave = '保存';
  static const String buttonDelete = '删除';
  static const String buttonEdit = '编辑';
  static const String buttonAdd = '添加';
  static const String buttonSubmit = '提交';
  static const String buttonLogin = '登录';
  static const String buttonRegister = '注册';
  static const String buttonLogout = '退出';
  static const String buttonBack = '返回';
  static const String buttonNext = '下一步';

  // ============ 表单标签 ============
  static const String labelName = '姓名';
  static const String labelEmail = '邮箱';
  static const String labelPassword = '密码';
  static const String labelPhone = '手机号';
  static const String labelAddress = '地址';
  static const String labelGender = '性别';
  static const String labelAge = '年龄';
  static const String labelBirthday = '生日';

  // ============ 提示信息 ============
  static const String hintName = '请输入姓名';
  static const String hintEmail = '请输入邮箱';
  static const String hintPassword = '请输入密码';
  static const String hintPhone = '请输入手机号';
  static const String hintAddress = '请输入地址';
  static const String hintSearch = '搜索...';

  // ============ 验证错误信息 ============
  static const String errorRequired = '此字段不能为空';
  static const String errorInvalidEmail = '邮箱格式不正确';
  static const String errorPasswordTooShort = '密码长度不能少于6位';
  static const String errorInvalidPhone = '手机号格式不正确';

  // ============ 成功提示 ============
  static const String successSaved = '保存成功';
  static const String successDeleted = '删除成功';
  static const String successSubmitted = '提交成功';
  static const String successLoggedIn = '登录成功';
  static const String successLoggedOut = '已退出登录';

  // ============ 对话框 ============
  static const String dialogTitleLogout = '退出登录';
  static const String dialogMessageLogout = '确定要退出登录吗？';
  static const String dialogTitleDelete = '删除确认';
  static const String dialogMessageDelete = '确定要删除此项吗？';

  // ============ 加载状态 ============
  static const String loadingDefault = '加载中...';
  static const String loadingData = '正在加载数据...';
  static const String loadingMore = '加载更多...';

  // ============ 空状态 ============
  static const String emptyCart = '购物车是空的';
  static const String emptyList = '暂无数据';
  static const String emptySearch = '没有找到相关内容';

  // ============ 性别选项 ============
  static const String genderMale = '男';
  static const String genderFemale = '女';
  static const String genderOther = '其他';
}
