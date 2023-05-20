import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../app_const/platform.dart';
import '../../../app_const/resurces.dart';
import '../dialogs/general_dialog.dart';

Future<dynamic> loadLiabraryDialog(
    {required BuildContext context, required Future<void> future}) async {
  if (!isWeb) {
    await future;
    return true;
  }
  return await generalDialog(
    context: context,
    dismissible: false,
    removeBackground: true,
    content: FutureBuilder<void>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pop(context, !snapshot.hasError);
          });
        }
        return Lottie.asset(loadingAnimation, width: 150, height: 150);
      },
    ),
  );
}
