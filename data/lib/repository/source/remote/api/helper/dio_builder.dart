import 'package:dio/dio.dart';

class DioBuilder {
  const DioBuilder._();

  static const defaultConnectTimeout = Duration(seconds: 30);
  static const defaultReceiveTimeout = Duration(seconds: 30);
  static const defaultSendTimeout = Duration(seconds: 30);

  static Dio createDio({
    required BaseOptions options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: options.baseUrl,
        connectTimeout: options.connectTimeout ?? defaultConnectTimeout,
        receiveTimeout: options.receiveTimeout ?? defaultReceiveTimeout,
        sendTimeout: options.sendTimeout ?? defaultSendTimeout,
      ),
    );
    if (interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
    return dio;
  }
}
