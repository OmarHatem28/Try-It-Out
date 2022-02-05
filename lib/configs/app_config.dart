import 'package:logger/logger.dart';

class AppConfig {
  static const String appName = 'Try it out';

  static const Level failuresLogLevel = Level.error;

  static final Logger failureLogger = Logger(
    filter: ProductionFilter(),
    level: failuresLogLevel,
    printer: PrettyPrinter(methodCount: 4),
  );

  /// Store Links
  static const String playStore = "";
  static const String appStore = "";
}