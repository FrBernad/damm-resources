enum Flavor {
  development,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  /// Adds flavor to the name of the app
  static String get title => 'Riverpod Test';

  /// Defines the environment variables filename for each flavor
  static String get envFileName =>
      'lib/riverpod/config/env/.env.${appFlavor?.name}';
}
