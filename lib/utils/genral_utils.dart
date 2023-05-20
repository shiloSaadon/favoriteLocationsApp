import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_app_4_host/providers/theme_provider.dart';

import '../app_const/platform.dart';

/// set the app into full screen
Future<void> overLaysHandling({Brightness? overideBrightness}) async {
  if (isWeb) return;
  SystemUiOverlayStyle? style;
  Brightness brightness = ThemeProvider().currentTheme.brightness;

  brightness = overideBrightness ?? brightness;

  style = brightness == Brightness.light
      ? SystemUiOverlayStyle.dark
      : SystemUiOverlayStyle.light;

  if (Platform.isAndroid) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []);
  } else if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(style);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }
}

/// dismiss key board and unfocus fields
void dismissKeyboard(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}
