import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast = FToast();

class CustomToast {
  final String msg;
  final Duration toastLength;
  final ToastGravity gravity;
  final BuildContext context;
  final Widget? child;

  const CustomToast(
      {required this.context,
      required this.msg,
      this.toastLength = const Duration(seconds: 2),
      this.gravity = ToastGravity.BOTTOM,
      this.child});

  void init() {
    // cleaning the queue to not spam the user
    fToast.removeQueuedCustomToasts();
    // init the new toast and show it to the user
    fToast.init(context);
    fToast.showToast(
        child: toastContent(), toastDuration: toastLength, gravity: gravity);
  }

  Widget toastContent() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.secondary),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
        child: child ??
            Text(
              msg,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
