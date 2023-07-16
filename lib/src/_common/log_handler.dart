import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  //Консольный вывод
  static final Logger console = Logger();
  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  static init() async {

    _initCrashlytics();

  }

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
        _logEvent(level, message);
        break;
      case Level.warning:
        if (kDebugMode) console.w(message, error, stackTrace);
        _logEvent(level, message);
        break;
      case Level.error:
        if (kDebugMode) console.e(message, error, stackTrace);
        _logEvent(level, message);
        break;
      case Level.wtf:
        if (kDebugMode) console.wtf(message, error, stackTrace);
        _logEvent(level, message);
        break;
      case Level.nothing:
        if (kDebugMode) console.v(message, error, stackTrace);
        break;
    }
  }

  static v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.verbose, message, error, stackTrace);
  }

  static d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode)show(Level.debug, message, error, stackTrace);
  }

  static i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.info, message, error, stackTrace);
  }

  static w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.warning, message, error, stackTrace);
  }

  static e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.error, message, error, stackTrace);
  }

  static wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.wtf, message, error, stackTrace);
  }

  static n(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) show(Level.verbose, message, error, stackTrace);
  }


  static _logEvent(Level level, message){
    analytics.logEvent(
        name: level.name,
        parameters: {
          'message' : message,
        }
    ).then((value) {
      d('event has been send');
    });

  }

  static _initCrashlytics() {
    FlutterError.onError = (errorDetail) {
      d('Caught error in FlutterError.onError');
      FirebaseCrashlytics.instance.recordFlutterError(errorDetail);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      d('Caught error in PlatformDispatcher.onError');
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      );
      return true;
    };

    d('Crashlytics initialized');
  }
}
