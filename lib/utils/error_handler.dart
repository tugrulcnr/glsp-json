import 'package:flutter/material.dart';

class ErrorHandler {
  static Widget handleError(Widget Function() widgetBuilder) {
    try {
      return widgetBuilder();
    } catch (e) {
      return ErrorWidget(e);
    }
  }
}