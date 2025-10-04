# Flutter 开发常用命令

.PHONY: format clean build run install

# 格式化代码
format:
	@echo "🎨 格式化代码..."
	@dart format lib test

# 清理项目
clean:
	@echo "🧹 清理项目..."
	@flutter clean

# 安装依赖
install:
	@echo "📦 安装依赖..."
	@flutter pub get

# 运行项目（iOS 模拟器）
run:
	@echo "🚀 运行项目..."
	@flutter run

# 构建 iOS
build-ios:
	@echo "📱 构建 iOS..."
	@flutter build ios

# 构建 Web
build-web:
	@echo "🌐 构建 Web..."
	@flutter build web

# 检查代码
lint:
	@echo "🔍 检查代码..."
	@flutter analyze

# 运行测试
test:
	@echo "🧪 运行测试..."
	@flutter test

# 完整检查（格式化 + 代码检查 + 测试）
check: format lint test
	@echo "✅ 检查完成！"

