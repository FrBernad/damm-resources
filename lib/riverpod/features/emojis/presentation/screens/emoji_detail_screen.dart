import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/controllers/get_emoji_by_id_controller.dart';
import '../widgets/error_message.dart';

class EmojiDetailScreen extends ConsumerWidget {
  static const route = "/emojis/:id";

  static String routeFromId(String id) => '/emojis/$id';
  static const routeName = "emojisDetail";

  final String id;

  const EmojiDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emojiAsync = ref.watch(getEmojiByIdControllerProvider(emojiId: id));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emoji Detail"),
      ),
      body: emojiAsync.when(
        data: (emoji) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              emoji.character,
              style: const TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    emoji.unicodeName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => const Center(child: ErrorMessage()),
      ),
    );
  }
}
