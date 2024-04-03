import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Extension for quickly accessing app [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Extension for quickly accessing app [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for quickly accessing app [Theme]
  ThemeData get theme => Theme.of(this);

  /// Extension for quickly accessing screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Extension for quickly accessing beamer root path
  String get beamerRootPath =>
      (Beamer.of(this).currentBeamLocation.state as BeamState)
          .uri
          .pathSegments
          .first;

  /// Extension for quickly accessing beamer path segments
  List<String> get beamerPathSegments =>
      (Beamer.of(this).currentBeamLocation.state as BeamState).uri.pathSegments;
}
