import '../models/emoji_model.dart';

abstract interface class EmojiService {
  Future<Emoji> getEmojiById({
    required String emojiId,
  });

  Future<List<Emoji>> getEmojis({
    required String searchTerm,
  });
}
