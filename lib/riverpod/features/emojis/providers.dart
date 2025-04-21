// Data
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itba_damm/riverpod/features/emojis/domain/services/emoji_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/providers.dart';
import 'data/datasources/remote/emoji_remote_data_source.dart';
import 'data/services/emoji_service_impl.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
EmojiRemoteDataSource emojiRemoteDataSource(
  Ref ref,
) =>
    EmojiRemoteDatasourceImpl(
      httpClient: ref.watch(dioProvider),
    );

@Riverpod(keepAlive: true)
EmojiService emojiService(
  Ref ref,
) =>
    EmojiServiceImpl(
      emojisRemoteDatasource: ref.watch(emojiRemoteDataSourceProvider),
    );
