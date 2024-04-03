import '../../domain/models/emoji_model.dart';

class EmojiEntity {
  final String slug;
  final String character;
  final String unicodeName;
  final String codePoint;
  final String group;
  final String subGroup;

  const EmojiEntity({
    required this.slug,
    required this.character,
    required this.unicodeName,
    required this.codePoint,
    required this.group,
    required this.subGroup,
  });

  factory EmojiEntity.fromJson(Map<String, dynamic> json) {
    return EmojiEntity(
      slug: json['slug'] as String,
      character: json['character'] as String,
      unicodeName: json['unicodeName'] as String,
      codePoint: json['codePoint'] as String,
      group: json['group'] as String,
      subGroup: json['subGroup'] as String,
    );
  }

  Emoji toModel() {
    return Emoji(
      slug: slug,
      character: character,
      unicodeName: unicodeName,
      codePoint: codePoint,
      group: group,
      subGroup: subGroup,
    );
  }
}
