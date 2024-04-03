import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/logger/logger.dart';
import 'flavors.dart';

import 'config/providers.dart' as providers;

/// Initializes app dependencies before it starts
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [],
    observers: [
      if (F.appFlavor == Flavor.development) _LoggerProviderObserver()
    ],
  );

  await providers.initializeProviders(container);

  return container;
}

class _LoggerProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d(
      'Provider: ${provider.name ?? provider.runtimeType}\n'
      'New Value: $newValue',
    );
  }
}
