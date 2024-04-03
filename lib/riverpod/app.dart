import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router/router.dart';
import 'flavors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainBeamerDelegate = ref.watch(mainBeamerDelegateProvider);

    return MaterialApp.router(
      title: F.title,

      // Routing
      routerDelegate: mainBeamerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: mainBeamerDelegate,
      ),

      // Debugging
      debugShowCheckedModeBanner: false,
    );
  }
}
