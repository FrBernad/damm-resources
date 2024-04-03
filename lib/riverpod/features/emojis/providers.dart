// Data
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/providers.dart';
import 'data/datasources/remote/emoji_remote_data_source.dart';
import 'data/repositories/emoji_repository_impl.dart';
import 'domain/repositories/emoji_repository.dart';

part 'generated/providers.g.dart';

///
/// Data dependencies
///

@Riverpod(keepAlive: true)
EmojiRemoteDataSource emojiRemoteDataSource(
  EmojiRemoteDataSourceRef ref,
) =>
    EmojiRemoteDatasourceImpl(
      httpClient: ref.watch(dioProvider),
    );

@Riverpod(keepAlive: true)
EmojiRepository emojiRepository(
  EmojiRepositoryRef ref,
) =>
    EmojiRepositoryImpl(
      emojisRemoteDatasource: ref.watch(emojiRemoteDataSourceProvider),
    );
