import 'package:flutter/material.dart';

T valueOrDefault<T>(T? value, T defaultValue) {
  return value ?? defaultValue;
}

class FFAppState {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  // Add any app state variables here
}

class FFRoute {
  static Future<dynamic> push(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushReplacement(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, [dynamic result]) {
    Navigator.of(context).pop(result);
  }
}

T createModel<T>(BuildContext context, T Function() create) {
  return create();
}

extension ListExtensions<T> on List<T> {
  List divide(dynamic separator) {
    if (isEmpty) return [];
    List result = [];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) result.add(separator);
    }
    return result;
  }
}

void safeSetState(VoidCallback callback) {
  callback();
}

Widget wrapWithModel<T>({
  T? model,
  VoidCallback? updateCallback,
  required Widget child,
}) {
  return child;
}