import 'package:dio/dio.dart';
import 'error_handler.dart';
import 'package:flutter/foundation.dart';

/// Custom Interceptor để quản lý log, request, response, error
class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Logging request (có thể dùng debugdebugPrint thay vì debugPrint)
    debugPrint("➡️ REQUEST[${options.method}] => PATH: ${options.uri}");
    debugPrint("Headers: ${options.headers}");
    debugPrint("Data: ${options.data}");
    handler.next(options); // tiếp tục
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Logging response
    debugPrint(
      "✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.uri}",
    );
    debugPrint("Data: ${response.data}");
    handler.next(response); // tiếp tục
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Map DioException → AppException
    final appException = ErrorHandler.map(err);

    // Log lỗi
    debugPrint(
      "❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri}",
    );
    debugPrint(
      "Mapped Exception: ${appException.runtimeType} - ${appException.message}",
    );

    // Bạn có thể trả về lại DioError mới hoặc throw AppException
    handler.reject(
      err.copyWith(error: appException), // gắn AppException vào error
    );
  }
}
