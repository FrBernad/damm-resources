import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/controllers/emojis_search_controller.dart';
import '../widgets/emojis_list.dart';
import '../widgets/emojis_search_bar.dart';

class EmojisScreen extends ConsumerWidget {
  static const route = "/emojis";
  static const routeName = "emojis";

  const EmojisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emojis Finder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: EmojisSearchBar(
              onChanged: (value) {
                ref
                    .read(emojisSearchControllerProvider.notifier)
                    .search(searchTerm: value);
              },
            ),
          ),
          const Expanded(child: EmojisList()),
        ],
      ),
    );
  }
}
