import 'package:dio/dio.dart';

import '../logger/logger.dart';
import '../providers.dart';

class DioInterceptor extends Interceptor {
  DioRef ref;

  DioInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
      'Request[${options.method}]:\n'
      '- URI: ${dioRequestToUri(options.baseUrl, options.path, options.queryParameters)}\n'
      '- Body: ${options.data}',
    );
    options.queryParameters.putIfAbsent(
      'access_key',
      () => ref.read(envProvider).accessToken,
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'Response[${response.statusCode}]:\n'
      '- URI: ${dioRequestToUri(response.requestOptions.baseUrl, response.requestOptions.path, response.requestOptions.queryParameters)}\n'
      '- Body: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.d(
      'Error[${err.response?.statusCode}]:\n'
      '- URI: ${dioRequestToUri(err.requestOptions.baseUrl, err.requestOptions.path, err.requestOptions.queryParameters)}\n',
    );
    return super.onError(err, handler);
  }
}

dioRequestToUri(String baseUrl, String path, Map<String, dynamic> queryParams) {
  var schemeAndHost = baseUrl.split('://');
  var scheme = schemeAndHost[0];
  var host = schemeAndHost[1];
  return "$scheme://$host$path?${queryParams.isEmpty ? '' : queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}";
}
