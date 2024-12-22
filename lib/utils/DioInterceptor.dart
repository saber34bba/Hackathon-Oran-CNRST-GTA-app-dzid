import 'package:dio/dio.dart';


class DioInterceptor extends Interceptor {
  late Dio dio;

  // Callbacks for handling errors, timeouts, and success
  final Function(String message)? onErrorCallback;
  final Function(String message)? onTimeoutCallback;
  final Function(String message)? onSuccessCallback;

  // Constructor to accept callback functions
  DioInterceptor({
    this.onErrorCallback,
    this.onTimeoutCallback,
    this.onSuccessCallback,
  });
  Dio instance() {
    dio = Dio(
       BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        //baseUrl: "http://192.168.110.250",
        baseUrl: "http://192.168.1.66",
        validateStatus: (status) {
          return status != null && status >= 200 && status < 400;
        },
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
/*        var authToken = await StorageService().get("authToken");
        if (authToken != null) {
          options.headers['authorization'] = "Bearer $authToken";
        }*/
        super.onRequest(options, handler);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Call the success callback if defined
        if (onSuccessCallback != null) {
             onSuccessCallback!("Request successful: ${response.statusCode}");
        }
        super.onResponse(response, handler);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        // Call the error callback if defined
        if (error.type == DioExceptionType.connectionTimeout) {
          onTimeoutCallback?.call("Request timeout: ${error.message}");
        } else {
          onErrorCallback?.call("Request failed: ${error.message}");
        }
        super.onError(error, handler);
      },
    ));
    return dio;
  }
}
