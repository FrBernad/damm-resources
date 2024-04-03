import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/logger/logger.dart';
import '../../entities/emoji_entity.dart';

abstract interface class EmojiRemoteDataSource {
  Future<Option<EmojiEntity>> getEmojiById({required String emojiId});

  Future<List<EmojiEntity>> getEmojis({
    required String searchTerm,
  });
}

class EmojiRemoteDatasourceImpl extends EmojiRemoteDataSource {
  final Dio httpClient;

  EmojiRemoteDatasourceImpl({
    required this.httpClient,
  });

  @override
  Future<Option<EmojiEntity>> getEmojiById({required String emojiId}) async {
    try {
      final emojiResult = await httpClient.get(
        "/$emojiId",
      );
      return emojiResult.data == null
          ? const Option.none()
          : Option.of(EmojiEntity.fromJson(emojiResult.data![0]));
    } on DioException catch (e) {
      logger.d("Error: $e");
      return const Option.none();
    }
  }

  @override
  Future<List<EmojiEntity>> getEmojis({required String searchTerm}) async {
    try {
      final emojisResults = await httpClient.get(
        "",
        queryParameters: searchTerm.isNotEmpty ? {"search": searchTerm} : null,
      );

      return List<EmojiEntity>.from(
          emojisResults.data?.map((e) => EmojiEntity.fromJson(e)) ?? []);
    } on DioException catch (e) {
      logger.d("Error: $e");
      return [];
    }
  }
}
