import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../domain/models/emoji_model.dart';
import '../screens/emoji_detail_screen.dart';

class EmojiCard extends StatelessWidget {
  const EmojiCard({
    super.key,
    required this.emoji,
  });

  final Emoji emoji;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.beamToNamed(EmojiDetailScreen.routeFromId(emoji.slug)),
      child: Row(
        children: [
          Text(
            emoji.character,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              emoji.unicodeName,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
