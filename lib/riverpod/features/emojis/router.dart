import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/emoji_detail_screen.dart';
import 'presentation/screens/emojis_screen.dart';

class EmojisLocation extends BeamLocation<BeamState> {
  EmojisLocation(RouteInformation super.routeInformation);

  @override
  List<String> get pathPatterns => [
        EmojisScreen.route,
        EmojiDetailScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('emojis'),
        title: 'Emojis',
        child: EmojisScreen(),
      ),
    ];

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pages.add(
        BeamPage(
          key: ValueKey('emojis-$id'),
          title: 'Emoji $id',
          child: EmojiDetailScreen(id: id),
        ),
      );
    }

    return pages;
  }
}
