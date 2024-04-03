import 'package:beamer/beamer.dart';

import '../../logger/logger.dart';

final BeamGuard routerLogger = BeamGuard(
  pathPatterns: ['*'],
  check: (context, location) {
    logger.d('Navigating to ${location.state.routeInformation.uri.path}');
    return true;
  },
);
