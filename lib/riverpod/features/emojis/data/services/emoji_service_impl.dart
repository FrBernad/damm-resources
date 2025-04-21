import 'package:fpdart/fpdart.dart';
import 'package:itba_damm/riverpod/features/emojis/domain/services/emoji_service.dart';

import '../../domain/models/emoji_model.dart';
import '../datasources/remote/emoji_remote_data_source.dart';
import '../entities/emoji_entity.dart';

class EmojiServiceImpl implements EmojiService {
  final EmojiRemoteDataSource emojisRemoteDatasource;

  EmojiServiceImpl({
    required this.emojisRemoteDatasource,
  });

  @override
  Future<Emoji> getEmojiById({required String emojiId}) async {
    final Option<EmojiEntity> emojiEntityOpt =
        await emojisRemoteDatasource.getEmojiById(emojiId: emojiId);

    if (emojiEntityOpt.isNone()) {
      throw Exception();
    }

    return emojiEntityOpt.toNullable()!.toModel();
  }

  @override
  Future<List<Emoji>> getEmojis({required String searchTerm}) async {
    final List<EmojiEntity> emojiEntities =
        await emojisRemoteDatasource.getEmojis(searchTerm: searchTerm);

    return emojiEntities.map((e) => e.toModel()).toList();
  }
}
