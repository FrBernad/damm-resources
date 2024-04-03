import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/emoji_model.dart';
import '../../providers.dart';

part 'generated/emojis_search_controller.g.dart';

@riverpod
class EmojisSearchController extends _$EmojisSearchController {
  Timer? _debounceTimer;

  @override
  Future<List<Emoji>> build() async {
    ref.onDispose(() {
      if (_debounceTimer != null) _debounceTimer!.cancel();
    });

    return await _getEmojis(searchTerm: '');
  }

  Future<void> search({
    required String searchTerm,
  }) async {
    if (_debounceTimer != null) _debounceTimer!.cancel();

    _debounceTimer = Timer(
      const Duration(milliseconds: 400),
      () async {
        state =
            await AsyncValue.guard(() => _getEmojis(searchTerm: searchTerm));
      },
    );
  }

  Future<List<Emoji>> _getEmojis({
    required String searchTerm,
  }) async {
    final emojis = await ref
        .read(emojiRepositoryProvider)
        .getEmojis(searchTerm: searchTerm);

    return emojis;
  }
}
