import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/emojis/presentation/screens/emoji_detail_screen.dart';
import '../../features/emojis/presentation/screens/emojis_screen.dart';
import '../../features/emojis/router.dart';
import 'guards/logger.dart';

part 'generated/router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> mainBeamerDelegate(MainBeamerDelegateRef ref) =>
    BeamerDelegate(
      initialPath: EmojisScreen.route,
      locationBuilder: _locationBuilder,
      guards: [
        routerLogger,
      ],
    );

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.uri.path.contains(EmojiDetailScreen.routeName)) {
    return EmojisLocation(routeInformation);
  }
  return EmojisLocation(routeInformation);
}
