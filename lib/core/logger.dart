import 'dart:developer' as developer;
import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  static int counter = 0;
  final String className;

  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    developer.log(
      event.message,
      time: DateTime.now(),
      level: _mapLevel(event.level),
      name: className,
      error: event.error,
      sequenceNumber: counter++,
    );

    return [event.message];
  }

  int _mapLevel(Level level) {
    switch (level) {
      case Level.trace:
        return 300;
      case Level.debug:
        return 500;
      case Level.info:
        return 800;
      case Level.warning:
        return 1500;
      case Level.error:
        return 2000;
      case Level.fatal:
        return 2000;
      default:
        return 800;
    }
  }
}

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}