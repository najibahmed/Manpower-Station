import 'package:logger/logger.dart';

/// logger Util Log Type
enum LogType { verbose, debug, info, warning, error, terribleFailure }

class LoggerUtil{

  static LoggerUtil instance = LoggerUtil();

  static final logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      methodCount: 0,
      printEmojis: true,

    ),
  );

  printLog({required Object? msg, LogType logType = LogType.debug}) {
    switch (logType) {
      case LogType.verbose:
        return logger.t(msg);
      case LogType.debug:
        return logger.d(msg);
      case LogType.info:
        return logger.i(msg);
      case LogType.warning:
        return logger.w(msg);
      case LogType.error:
        return logger.e(msg);
      case LogType.terribleFailure:
        return logger.f(msg);
    }
  }
}