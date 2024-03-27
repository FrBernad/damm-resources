import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:itba_damm/beamer/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Beamer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate3,
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate3),
    );
  }
}
