import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/emoji_model.dart';
import '../../providers.dart';

part 'generated/get_emoji_by_id_controller.g.dart';

@riverpod
Future<Emoji> getEmojiByIdController(
  Ref ref, {
  required String emojiId,
}) async {
  return await ref.read(emojiServiceProvider).getEmojiById(emojiId: emojiId);
}
