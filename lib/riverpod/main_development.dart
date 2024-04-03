import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;

  ProviderContainer container = await bootstrap();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}
