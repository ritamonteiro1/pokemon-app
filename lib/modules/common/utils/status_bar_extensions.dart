import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension StatusBarExtension on Color {
  void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: this,
    ));
  }
}
