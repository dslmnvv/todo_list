import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  //Консольный вывод
  static final Logger console = Logger();

  static show(Level level, dynamic message,
      [dynamic error, StackTrace? stackTrace]) {
    switch (level) {
      case Level.verbose:
        if (kDebugMode) console.v(message, error, stackTrace);
        break;
      case Level.debug:
        if (kDebugMode) console.d(message, error, stackTrace);
        break;
      case Level.info:
        if (kDebugMode) console.i(message, error, stackTrace);
        break;
      case Level.warning:
        if (kDebugMode) console.w(message, error, stackTrace);
        break;
      case Level.error:
        if (kDebugMode) console.e(message, error, stackTrace);
        break;
      case Level.wtf:
        if (kDebugMode) console.wtf(message, error, stackTrace);
        break;
      case Level.nothing:
        if (kDebugMode) console.v(message, error, stackTrace);
        break;
    }
  }

  static v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.v(message, error, stackTrace);
  }

  static d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.d(message, error, stackTrace);
  }

  static i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.i(message, error, stackTrace);
  }

  static w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.w(message, error, stackTrace);
  }

  static e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.e(message, error, stackTrace);
  }

  static wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.wtf(message, error, stackTrace);
  }

  static n(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) console.v(message, error, stackTrace);
  }
}
