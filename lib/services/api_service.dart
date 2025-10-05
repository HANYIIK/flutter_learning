/// API 服务基类
/// 模拟后端 API 请求（教学用）
class ApiService {
  // 模拟网络延迟
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// 模拟 GET 请求
  Future<Map<String, dynamic>> get(String endpoint) async {
    await Future.delayed(_networkDelay);

    // 模拟成功响应
    return {'success': true, 'data': {}, 'message': 'Success'};
  }

  /// 模拟 POST 请求
  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    await Future.delayed(_networkDelay);

    // 模拟成功响应
    return {'success': true, 'data': data, 'message': 'Created successfully'};
  }

  /// 模拟 PUT 请求
  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    await Future.delayed(_networkDelay);

    // 模拟成功响应
    return {'success': true, 'data': data, 'message': 'Updated successfully'};
  }

  /// 模拟 DELETE 请求
  Future<Map<String, dynamic>> delete(String endpoint) async {
    await Future.delayed(_networkDelay);

    // 模拟成功响应
    return {'success': true, 'data': null, 'message': 'Deleted successfully'};
  }

  /// 模拟错误响应
  Future<Map<String, dynamic>> getWithError(String endpoint) async {
    await Future.delayed(_networkDelay);

    throw Exception('Network error: Failed to fetch data');
  }
}
