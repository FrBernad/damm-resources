import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/controllers/emojis_search_controller.dart';
import 'emoji_card.dart';
import 'error_message.dart';
import 'no_emojis_found.dart';

class EmojisList extends ConsumerWidget {
  const EmojisList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emojiSearchController = ref.watch(emojisSearchControllerProvider);

    return emojiSearchController.when(
      data: (emojis) {
        if (emojis.isEmpty) {
          return const NoEmojisFound();
        } else {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            itemCount: emojis.length,
            itemBuilder: (context, index) => EmojiCard(
              emoji: emojis[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
          );
        }
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) =>
          const Align(alignment: Alignment.topCenter, child: ErrorMessage()),
    );
  }
}
