import 'package:equatable/equatable.dart';

class Emoji extends Equatable {
  final String slug;
  final String character;
  final String unicodeName;
  final String codePoint;
  final String group;
  final String subGroup;

  const Emoji({
    required this.slug,
    required this.character,
    required this.unicodeName,
    required this.codePoint,
    required this.group,
    required this.subGroup,
  });

  @override
  List<Object?> get props => [codePoint];
}
