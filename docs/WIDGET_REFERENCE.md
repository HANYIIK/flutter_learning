# Flutter Widget 速查手册 📖

> 用 React、Vue、HTML、shadcn/ui 类比理解 Flutter Widget

---

## 🏗️ 布局 Widget

### **Scaffold - 页面骨架**

#### **Flutter:**
```dart
Scaffold(
  appBar: AppBar(),           // 顶部栏
  body: Center(),             // 主内容
  bottomNavigationBar: Nav(), // 底部导航
  floatingActionButton: FAB(), // 悬浮按钮
  drawer: Drawer(),           // 侧边抽屉
)
```

#### **对比 React/HTML:**
```jsx
// React
<div className="page-layout">
  <header>AppBar</header>
  <main>Content</main>
  <nav>BottomNav</nav>
  <button className="fab">+</button>
  <aside className="drawer">Drawer</aside>
</div>
```

#### **对比 Vue:**
```vue
<template>
  <div class="scaffold">
    <AppBar />
    <main>{{ content }}</main>
    <BottomNav />
    <FloatingButton />
  </div>
</template>
```

**说明：**
- 🎯 `Scaffold` = 页面的基础结构
- 🎯 提供了标准的 Material Design 布局
- 🎯 类似 HTML5 的 `<header>`, `<main>`, `<footer>` 的组合
- 🎯 自动处理键盘遮挡、滚动等问题

**在你的项目中：**
- 📁 `home_screen.dart` 第 49 行
- 📁 每个页面都从 `Scaffold` 开始

---

### **Container - 万能容器**

#### **Flutter:**
```dart
Container(
  width: 100,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text('Hello'),
)
```

#### **对比 HTML/CSS:**
```html
<div style="
  width: 100px;
  height: 100px;
  padding: 16px;
  margin: 8px;
  background: blue;
  border-radius: 12px;
">Hello</div>
```

#### **对比 React (styled-components):**
```jsx
const Box = styled.div`
  width: 100px;
  height: 100px;
  padding: 16px;
  margin: 8px;
  background: blue;
  border-radius: 12px;
`;

<Box>Hello</Box>
```

#### **对比 shadcn/ui:**
```jsx
// shadcn/ui Card
<div className="rounded-lg bg-blue-500 p-4">
  Hello
</div>

// Flutter Container
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
  ),
  padding: EdgeInsets.all(16),
  child: Text('Hello'),
)
```

**说明：**
- 🎯 `Container` = `<div>` 的超级版本
- 🎯 可以设置宽高、内外边距、背景、边框、阴影
- 🎯 是最常用的布局 Widget

**在你的项目中：**
- 📁 `home_screen.dart` 第 37 行（TabBar 外层容器）
- 📁 到处都是！

---

### **Row - 水平布局**

#### **Flutter:**
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text('Left'),
    Text('Center'),
    Text('Right'),
  ],
)
```

#### **对比 CSS Flexbox:**
```css
.row {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
```

```html
<div class="row">
  <span>Left</span>
  <span>Center</span>
  <span>Right</span>
</div>
```

#### **对比 React:**
```jsx
<div style={{
  display: 'flex',
  flexDirection: 'row',
  justifyContent: 'space-between',
  alignItems: 'center',
}}>
  <span>Left</span>
  <span>Center</span>
  <span>Right</span>
</div>
```

**属性对应：**
| Flutter | CSS Flexbox |
|---------|------------|
| `Row()` | `flex-direction: row` |
| `Column()` | `flex-direction: column` |
| `mainAxisAlignment` | `justify-content` |
| `crossAxisAlignment` | `align-items` |
| `mainAxisSize` | `width: fit-content / 100%` |

**在你的项目中：**
- 📁 `home_screen.dart` 第 52 行（TabBar 的 Row）
- 📁 `basic_widgets_screen.dart`（到处都有）

---

### **Column - 垂直布局**

#### **Flutter:**
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text('Top'),
    Text('Middle'),
    Text('Bottom'),
  ],
)
```

#### **对比 CSS:**
```css
.column {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
}
```

**说明：**
- 🎯 `Column` = `display: flex; flex-direction: column;`
- 🎯 垂直排列子元素

**在你的项目中：**
- 📁 `home_screen.dart` 第 67 行（每个 Tab 项的垂直布局）

---

### **Expanded - 弹性占据剩余空间**

#### **Flutter:**
```dart
Row(
  children: [
    Text('Fixed'),
    Expanded(
      child: Text('Takes remaining space'),
    ),
    Text('Fixed'),
  ],
)
```

#### **对比 CSS Flexbox:**
```css
.container {
  display: flex;
}
.fixed { flex: 0; }
.expanded { flex: 1; }  /* ← Expanded */
```

```html
<div class="container">
  <div class="fixed">Fixed</div>
  <div class="expanded">Takes remaining space</div>
  <div class="fixed">Fixed</div>
</div>
```

#### **对比 React:**
```jsx
<div style={{ display: 'flex' }}>
  <div>Fixed</div>
  <div style={{ flex: 1 }}>Takes remaining space</div>
  <div>Fixed</div>
</div>
```

**说明：**
- 🎯 `Expanded` = `flex: 1`
- 🎯 占据父容器的剩余空间
- 🎯 多个 `Expanded` 会平分空间

**在你的项目中：**
- 📁 `home_screen.dart` 第 59 行
- 📁 每个 Tab 项都用 `Expanded` 平分空间

---

### **SizedBox - 固定尺寸容器**

#### **Flutter:**
```dart
SizedBox(
  width: 100,
  height: 100,
  child: Text('Fixed size'),
)

// 或作为间距
SizedBox(height: 16)  // 垂直间距
SizedBox(width: 16)   // 水平间距
```

#### **对比 HTML/CSS:**
```html
<!-- 固定尺寸 -->
<div style="width: 100px; height: 100px;">
  Fixed size
</div>

<!-- 间距 -->
<div style="height: 16px;"></div>
```

#### **对比 React:**
```jsx
// 固定尺寸
<div style={{ width: 100, height: 100 }}>
  Fixed size
</div>

// 间距（shadcn/ui 风格）
<div className="h-4" />  {/* Tailwind: h-4 = 16px */}

// Flutter
SizedBox(height: 16)
Gap(16)  // 使用 gap 包（更语义化）
```

**说明：**
- 🎯 `SizedBox` = 带固定宽高的 `<div>`
- 🎯 常用于设置间距（代替 `margin`）
- 🎯 比 `Container` 轻量（性能更好）

**在你的项目中：**
- 📁 `home_screen.dart` 第 50 行（固定 TabBar 高度为 60）
- 📁 `home_screen.dart` 第 78 行（图标和文字间距 3px）

---

### **IndexedStack - 层叠布局（保持状态）**

#### **Flutter:**
```dart
IndexedStack(
  index: _currentIndex,  // 显示第几个
  children: [
    Page1(),  // index = 0
    Page2(),  // index = 1
    Page3(),  // index = 2
  ],
)
```

#### **对比 React (Tab 切换):**
```jsx
// 普通方式（会重新渲染）
function TabView({ currentTab }) {
  switch(currentTab) {
    case 0: return <Page1 />;
    case 1: return <Page2 />;
    case 2: return <Page3 />;
  }
}

// 保持状态的方式（类似 IndexedStack）
function TabView({ currentTab }) {
  return (
    <>
      <div style={{ display: currentTab === 0 ? 'block' : 'none' }}>
        <Page1 />  {/* 保持挂载，只是隐藏 */}
      </div>
      <div style={{ display: currentTab === 1 ? 'block' : 'none' }}>
        <Page2 />
      </div>
    </>
  );
}
```

#### **对比 Vue:**
```vue
<template>
  <div>
    <div v-show="currentTab === 0"><Page1 /></div>
    <div v-show="currentTab === 1"><Page2 /></div>
    <div v-show="currentTab === 2"><Page3 /></div>
  </div>
</template>
```

**说明：**
- 🎯 `IndexedStack` = 多个组件层叠，只显示一个
- 🎯 **关键：所有子组件都保持挂载（状态不丢失）**
- 🎯 类似 `v-show` 而不是 `v-if`
- 🎯 类似 `display: none` 而不是条件渲染

**对比 Stack vs IndexedStack:**
| Widget | 说明 |
|--------|------|
| `Stack` | 所有子组件都显示（重叠） |
| `IndexedStack` | 只显示一个，其他隐藏但保持状态 |

**在你的项目中：**
- 📁 `home_screen.dart` 第 50 行
- 🎯 **作用：** 切换 Tab 时不会丢失页面状态（滚动位置、表单输入等）

---

### **SafeArea - 安全区域**

#### **Flutter:**
```dart
SafeArea(
  child: Text('Content'),
)
```

#### **对比 iOS:**
```
┌─────────────────┐
│   刘海/状态栏      │  ← SafeArea 自动避开
├─────────────────┤
│                 │
│     Content     │  ← 你的内容在安全区域
│                 │
├─────────────────┤
│  Home Indicator │  ← SafeArea 自动避开
└─────────────────┘
```

#### **对比 CSS:**
```css
/* iOS 安全区域 */
.safe-area {
  padding-top: env(safe-area-inset-top);
  padding-bottom: env(safe-area-inset-bottom);
  padding-left: env(safe-area-inset-left);
  padding-right: env(safe-area-inset-right);
}
```

#### **对比 React Native:**
```jsx
import { SafeAreaView } from 'react-native';

<SafeAreaView>
  <Text>Content</Text>
</SafeAreaView>
```

**说明：**
- 🎯 `SafeArea` = 自动处理 iOS 刘海、Home Indicator
- 🎯 确保内容不被系统 UI 遮挡
- 🎯 自动添加必要的 padding

**在你的项目中：**
- 📁 `home_screen.dart` 第 48 行
- 🎯 **作用：** 确保 TabBar 不被 Home Indicator 遮挡

---

### **InkWell - 水波纹点击效果**

#### **Flutter:**
```dart
InkWell(
  onTap: () => print('Clicked'),
  child: Text('Click me'),
)
```

#### **对比 HTML/CSS:**
```html
<button class="ripple-button">Click me</button>

<style>
.ripple-button:active {
  /* 点击时的水波纹效果 */
  animation: ripple 0.6s ease-out;
}
</style>
```

#### **对比 React (Material-UI):**
```jsx
// Material-UI
<ButtonBase onClick={handleClick}>
  Click me
</ButtonBase>

// Flutter
InkWell(
  onTap: handleClick,
  child: Text('Click me'),
)
```

#### **对比 shadcn/ui Button:**
```jsx
// shadcn/ui
<Button variant="ghost" onClick={handleClick}>
  Click me
</Button>

// Flutter InkWell
InkWell(
  onTap: handleClick,
  borderRadius: BorderRadius.circular(8),
  child: Container(
    padding: EdgeInsets.all(12),
    child: Text('Click me'),
  ),
)
```

**说明：**
- 🎯 `InkWell` = Material Design 的水波纹点击效果
- 🎯 类似 Material-UI 的 Ripple 效果
- 🎯 比普通 `onTap` 有视觉反馈

**替代方案：**
- `GestureDetector` - 无视觉效果的点击
- `TextButton` - 按钮样式
- `InkWell` - 水波纹效果

**在你的项目中：**
- 📁 `home_screen.dart` 第 61 行
- 🎯 **作用：** 点击 Tab 时有水波纹反馈

---

## 🎨 样式 Widget

### **BoxDecoration - 装饰器**

#### **Flutter:**
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.blue,              // background-color
    borderRadius: BorderRadius.circular(12),  // border-radius
    border: Border.all(color: Colors.red, width: 2),  // border
    boxShadow: [                     // box-shadow
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
    gradient: LinearGradient(        // linear-gradient
      colors: [Colors.blue, Colors.purple],
    ),
  ),
)
```

#### **对比 CSS:**
```css
.box {
  background-color: blue;
  border-radius: 12px;
  border: 2px solid red;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  background: linear-gradient(to right, blue, purple);
}
```

#### **对比 Tailwind CSS:**
```html
<div class="
  bg-blue-500 
  rounded-xl 
  border-2 border-red-500 
  shadow-lg 
  bg-gradient-to-r from-blue-500 to-purple-500
">
</div>
```

#### **对比 shadcn/ui:**
```jsx
// shadcn/ui Card
<div className="rounded-lg border bg-card shadow-sm">
  Content
</div>

// Flutter 等价
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
    border: Border.all(color: Colors.grey[300]!),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
      ),
    ],
  ),
)
```

**说明：**
- 🎯 `BoxDecoration` = CSS 的所有视觉样式
- 🎯 背景色、边框、圆角、阴影、渐变全包括
- 🎯 必须用在 `Container` 的 `decoration` 属性

**在你的项目中：**
- 📁 `home_screen.dart` 第 38 行（TabBar 的阴影）

---

### **BoxShadow - 阴影效果**

#### **Flutter:**
```dart
BoxShadow(
  color: Colors.black.withOpacity(0.1),
  blurRadius: 10,
  spreadRadius: 2,
  offset: Offset(0, 4),  // x, y
)
```

#### **对比 CSS:**
```css
box-shadow: 0 4px 10px 2px rgba(0,0,0,0.1);
/*          x y  blur spread color */
```

#### **对比 Tailwind:**
```html
<!-- Tailwind -->
<div class="shadow-lg">  <!-- 预设阴影 -->

<!-- Custom shadow -->
<div class="shadow-[0_4px_10px_rgba(0,0,0,0.1)]">
```

**属性对应：**
| Flutter | CSS |
|---------|-----|
| `offset: Offset(0, 4)` | `0 4px` |
| `blurRadius: 10` | `10px` |
| `spreadRadius: 2` | `2px` |
| `color: Colors.black.withOpacity(0.1)` | `rgba(0,0,0,0.1)` |

**在你的项目中：**
- 📁 `home_screen.dart` 第 40 行
- 🎯 **效果：** TabBar 顶部的微妙阴影

---

## 🎯 交互 Widget

### **InkWell vs GestureDetector**

#### **InkWell - 有水波纹**
```dart
InkWell(
  onTap: () {},
  onLongPress: () {},
  onDoubleTap: () {},
  borderRadius: BorderRadius.circular(12),
  child: Container(...),
)
```

#### **GestureDetector - 无水波纹**
```dart
GestureDetector(
  onTap: () {},
  onLongPress: () {},
  onDoubleTap: () {},
  child: Container(...),
)
```

#### **对比 React:**
```jsx
// Material-UI (类似 InkWell)
<ButtonBase onClick={handleClick}>
  Content
</ButtonBase>

// 普通 div (类似 GestureDetector)
<div onClick={handleClick}>
  Content
</div>
```

**选择建议：**
- ✅ Material Design 风格 → 用 `InkWell`
- ✅ iOS 风格 → 用 `GestureDetector`
- ✅ 自定义效果 → 用 `GestureDetector`

---

## 📦 特殊 Widget

### **bottomNavigationBar - 底部导航栏**

#### **Flutter Scaffold 属性:**
```dart
Scaffold(
  bottomNavigationBar: Widget,  // 特殊属性
)
```

#### **对比 HTML:**
```html
<div class="page">
  <main>Content</main>
  <nav class="bottom-nav">Navigation</nav>  ← bottomNavigationBar
</div>

<style>
.bottom-nav {
  position: fixed;
  bottom: 0;
  width: 100%;
}
</style>
```

#### **对比 React:**
```jsx
function Layout() {
  return (
    <div className="relative h-screen">
      <main className="pb-16">Content</main>
      <nav className="fixed bottom-0 w-full">
        Navigation
      </nav>
    </div>
  );
}
```

**说明：**
- 🎯 `bottomNavigationBar` 不是 Widget 类型，是 Scaffold 的属性
- 🎯 自动固定在底部
- 🎯 自动处理键盘遮挡

**在你的项目中：**
- 📁 `home_screen.dart` 第 37 行
- 🎯 **内容：** 自定义的 TabBar 容器

---

## 🎨 完整示例对比

### **shadcn/ui Card → Flutter Container**

#### **shadcn/ui:**
```jsx
<div className="rounded-lg border bg-card text-card-foreground shadow-sm">
  <div className="flex flex-col space-y-1.5 p-6">
    <h3 className="text-2xl font-semibold">Card Title</h3>
    <p className="text-sm text-muted-foreground">Card description</p>
  </div>
  <div className="p-6 pt-0">
    Card content
  </div>
</div>
```

#### **Flutter 等价:**
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey[300]!),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Card Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              'Card description',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Text('Card content'),
      ),
    ],
  ),
)
```

---

## 📋 完整 Widget 速查表

### **你代码中的 Widget 对照：**

| Flutter Widget | Web 等价 | 作用 | 位置（home_screen.dart） |
|---------------|---------|------|----------------------|
| `Scaffold` | `<div class="page-layout">` | 页面骨架 | 第 49 行 |
| `body:` | `<main>` | 主内容区域 | 第 50 行 |
| `bottomNavigationBar:` | `<nav class="fixed bottom-0">` | 底部导航 | 第 37 行 |
| `Container` | `<div>` | 通用容器 | 第 37 行 |
| `BoxDecoration` | CSS 样式集合 | 装饰样式 | 第 38 行 |
| `BoxShadow` | `box-shadow` | 阴影 | 第 40 行 |
| `SafeArea` | `padding: safe-area-inset` | 安全区域 | 第 48 行 |
| `SizedBox` | `<div style="width/height">` | 固定尺寸 | 第 50, 78 行 |
| `Row` | `display: flex; flex-direction: row` | 水平布局 | 第 52 行 |
| `Expanded` | `flex: 1` | 占满剩余空间 | 第 59 行 |
| `InkWell` | `<button>` + ripple effect | 点击反馈 | 第 61 行 |
| `Column` | `display: flex; flex-direction: column` | 垂直布局 | 第 67 行 |
| `IndexedStack` | `v-show` (Vue) | 保持状态切换 | 第 50 行 |
| `Icon` | `<i class="icon">` | 图标 | 第 71 行 |
| `Text` | `<span>` | 文本 | 第 79 行 |

---

## 🎓 完整代码解析（你的 home_screen.dart）

```dart
Scaffold(                              // = <div class="page">
  body: IndexedStack(                  // = 多个页面，v-show 切换
    index: _currentIndex,              // 显示第几个
    children: _screens,                // [Page1, Page2, Page3, Page4]
  ),
  
  bottomNavigationBar: Container(     // = <nav class="bottom-nav">
    decoration: BoxDecoration(         // CSS 样式
      color: Colors.white,             // background-color: white
      boxShadow: [                     // box-shadow
        BoxShadow(                     // 0 -5px 10px rgba(0,0,0,0.1)
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(0, -5),
        ),
      ],
    ),
    
    child: SafeArea(                   // iOS 安全区域
      top: false,                      // 不处理顶部（只处理底部）
      
      child: SizedBox(                 // <div style="height: 60px">
        height: 60,
        
        child: Row(                    // display: flex; flex-direction: row
          children: _navItems.map((item) {
            return Expanded(           // flex: 1
              child: InkWell(          // <button> 带水波纹
                onTap: () => setState(...),
                child: Column(         // flex-direction: column
                  children: [
                    Icon(item.icon),   // <i class="icon">
                    SizedBox(height: 3),  // margin-top: 3px
                    Text(item.label),  // <span>文字</span>
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  ),
)
```

---

## 🆚 Element UI / Ant Design 对比

### **Element UI Tabs → Flutter TabBar**

#### **Element UI:**
```vue
<el-tabs v-model="activeTab">
  <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
  <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
  <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
</el-tabs>
```

#### **Flutter 等价:**
```dart
// 方式1：官方 TabBar
TabBar(
  tabs: [
    Tab(text: '用户管理'),
    Tab(text: '配置管理'),
    Tab(text: '角色管理'),
  ],
)

// 方式2：自定义（你的项目）
Row(
  children: items.map((item) => 
    InkWell(
      onTap: () => setState(() => currentIndex = index),
      child: Text(item.label),
    )
  ).toList(),
)
```

---

### **shadcn/ui Tabs → Flutter**

#### **shadcn/ui:**
```jsx
<Tabs defaultValue="account">
  <TabsList>
    <TabsTrigger value="account">Account</TabsTrigger>
    <TabsTrigger value="password">Password</TabsTrigger>
  </TabsList>
  <TabsContent value="account">
    Account content
  </TabsContent>
  <TabsContent value="password">
    Password content
  </TabsContent>
</Tabs>
```

#### **Flutter 等价:**
```dart
// 你的项目就是这种实现！
class HomeScreen extends StatefulWidget {
  int _currentIndex = 0;
  
  // TabsList (底部导航)
  Row(
    children: _navItems.map((item) =>
      InkWell(
        onTap: () => setState(() => _currentIndex = index),
        child: Column(
          children: [Icon(item.icon), Text(item.label)],
        ),
      )
    ).toList(),
  )
  
  // TabsContent (内容区域)
  IndexedStack(
    index: _currentIndex,
    children: [Page1(), Page2(), Page3()],
  )
}
```

---

## 🎯 常用 Widget 完整分类

### **布局类（Layout）:**

| Flutter | HTML/CSS | shadcn/ui |
|---------|----------|-----------|
| `Container` | `<div>` | `<div className="...">` |
| `Row` | `display: flex; flex-direction: row` | `<div className="flex flex-row">` |
| `Column` | `display: flex; flex-direction: column` | `<div className="flex flex-col">` |
| `Stack` | `position: relative/absolute` | `<div className="relative">` |
| `Expanded` | `flex: 1` | `<div className="flex-1">` |
| `Flexible` | `flex: 0-1` | - |
| `Padding` | `padding: 16px` | `<div className="p-4">` |
| `Center` | `display: flex; justify/align: center` | `<div className="flex items-center justify-center">` |
| `Align` | `position: absolute` | - |
| `SizedBox` | `width/height: 100px` | `<div className="w-[100px] h-[100px]">` |

---

### **交互类（Interactive）:**

| Flutter | HTML/Web | 说明 |
|---------|----------|------|
| `InkWell` | `<button>` + ripple | 水波纹点击 |
| `GestureDetector` | `<div onClick>` | 无视觉反馈 |
| `ElevatedButton` | `<button class="btn-primary">` | 凸起按钮 |
| `TextButton` | `<button class="btn-text">` | 文字按钮 |
| `IconButton` | `<button class="icon-btn">` | 图标按钮 |

---

### **显示类（Display）:**

| Flutter | HTML | Element UI / shadcn |
|---------|------|-------------------|
| `Text` | `<span>`, `<p>` | `<p>` |
| `Icon` | `<i class="icon">` | `<Icon />` |
| `Image` | `<img>` | `<img>` |
| `Card` | `<div class="card">` | `<Card />` |
| `ListTile` | `<li>` | - |

---

### **输入类（Input）:**

| Flutter | HTML | Element UI | shadcn/ui |
|---------|------|-----------|-----------|
| `TextField` | `<input>` | `<el-input>` | `<Input />` |
| `TextFormField` | `<input>` + validation | `<el-form-item>` | `<Input />` |
| `Checkbox` | `<input type="checkbox">` | `<el-checkbox>` | `<Checkbox />` |
| `Radio` | `<input type="radio">` | `<el-radio>` | `<RadioGroup />` |
| `Switch` | `<input type="checkbox">` | `<el-switch>` | `<Switch />` |
| `Slider` | `<input type="range">` | `<el-slider>` | `<Slider />` |

---

## 💡 记忆技巧

### **布局记忆法：**
```
Container = div（万能容器）
Row = flex-row（水平）
Column = flex-column（垂直）
Expanded = flex: 1（占满）
```

### **交互记忆法：**
```
InkWell = button（有水波纹）
GestureDetector = div onClick（无水波纹）
```

### **样式记忆法：**
```
BoxDecoration = CSS 样式大全
BoxShadow = box-shadow
BorderRadius = border-radius
```

---

## 🎨 你的 TabBar 完整解析

```dart
Container(                          // <div class="bottom-nav">
  decoration: BoxDecoration(        // style={{ ... }}
    color: Colors.white,            //   backgroundColor: 'white'
    boxShadow: [                    //   boxShadow: '0 -5px 10px ...'
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, -5),
      ),
    ],
  ),
  child: SafeArea(                  // 处理 iOS 安全区域
    top: false,
    child: SizedBox(                // <div style="height: 60px">
      height: 60,
      child: Row(                   // <div class="flex flex-row">
        children: items.map((item) => 
          Expanded(                 //   <div class="flex-1">
            child: InkWell(         //     <button class="ripple">
              onTap: () {},         //       onClick={() => {}}
              child: Column(        //       <div class="flex flex-col">
                children: [
                  Icon(item.icon),  //         <i class="icon" />
                  SizedBox(height: 3),  //     <div class="h-[3px]" />
                  Text(item.label), //         <span>文字</span>
                ],
              ),
            ),
          ),
        ).toList(),
      ),
    ),
  ),
)
```

---

## 🎊 总结

### **你问的 Widget 总结：**

| Widget | 类比 | 作用 |
|--------|-----|------|
| `Scaffold` | 页面模板 | 提供标准页面结构 |
| `Container` | `<div>` | 通用容器 |
| `BoxDecoration` | CSS 样式 | 装饰效果 |
| `BoxShadow` | `box-shadow` | 阴影 |
| `Row` | `display: flex` (row) | 水平布局 |
| `Column` | `display: flex` (column) | 垂直布局 |
| `Expanded` | `flex: 1` | 占满空间 |
| `SizedBox` | 固定尺寸 div | 固定宽高 |
| `SafeArea` | 安全区域 padding | iOS 适配 |
| `InkWell` | `<button>` + ripple | 点击效果 |
| `IndexedStack` | `v-show` 切换 | 保持状态 |

### **核心理解：**
- ✅ Flutter = 一切都是 Widget 嵌套
- ✅ Widget = React Component = Vue Component
- ✅ 没有 HTML，没有 CSS，全是 Dart 代码
- ✅ 样式通过 Widget 属性设置，不是 CSS 类名

---

现在你应该完全理解这些 Widget 了！有任何其他 Widget 不懂的，随时问我！🚀
