import 'package:logger/logger.dart';

var logger = Logger(
  filter: null,
  // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 1,
  ),
  // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);
