import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../flavors.dart';
import 'env/env.dart';
import 'http_client/dio_interceptor.dart';

part 'generated/providers.g.dart';

///
/// Env Dependencies
///
@Riverpod(keepAlive: true)
Env env(EnvRef ref) => EnvImpl();

///
/// Data Dependencies
///
@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final env = ref.watch(envProvider);
  var dio = Dio(BaseOptions(baseUrl: env.apiBaseUrl));
  if (F.appFlavor == Flavor.development) {
    dio.interceptors.add(DioInterceptor(ref));
  }

  return dio;
}

///
/// Providers initialization for boostrap file
///
Future<void> initializeProviders(ProviderContainer container) async {
  /// Env
  await dotenv.load(fileName: F.envFileName);
  container.read(envProvider);

  /// Dio Setup
  container.read(dioProvider);
}
